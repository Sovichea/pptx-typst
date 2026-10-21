"""Small OOXML package writer for the supported static master/layout subset."""
from __future__ import annotations

from copy import deepcopy
import hashlib
from pathlib import Path, PurePosixPath
import posixpath
from zipfile import ZIP_DEFLATED, ZipFile

from lxml import etree

P = "http://schemas.openxmlformats.org/presentationml/2006/main"
R = "http://schemas.openxmlformats.org/officeDocument/2006/relationships"
PKG = "http://schemas.openxmlformats.org/package/2006/relationships"
CT = "http://schemas.openxmlformats.org/package/2006/content-types"
REL_SLIDE = R + "/slide"
REL_MASTER = R + "/slideMaster"
REL_LAYOUT = R + "/slideLayout"
REL_THEME = R + "/theme"
REL_IMAGE = R + "/image"


def _xml(data: bytes):
    return etree.fromstring(data)


def _dump(root) -> bytes:
    return etree.tostring(root, xml_declaration=True, encoding="UTF-8", standalone=True)


def _rels_path(part: str) -> str:
    path = PurePosixPath(part)
    return str(path.parent / "_rels" / (path.name + ".rels"))


def _rels(data: bytes | None = None):
    if data:
        return _xml(data)
    return etree.Element("{%s}Relationships" % PKG, nsmap={None: PKG})


def _relationship(root, rid: str):
    return next((rel for rel in root if rel.get("Id") == rid), None)


def _append_rel(root, rid: str, reltype: str, target: str):
    rel = etree.SubElement(root, "{%s}Relationship" % PKG)
    rel.set("Id", rid)
    rel.set("Type", reltype)
    rel.set("Target", target)
    return rel


def install_hierarchy(
    pptx_path: Path,
    *,
    masters: dict[str, str],
    layouts: dict[str, tuple[str, str]],
    slide_layouts: dict[str, str],
    stage_parts: dict[str, str],
    layout_show_master: dict[str, bool] | None = None,
    slide_show_master: dict[str, bool] | None = None,
    master_fills: dict[str, str] | None = None,
    layout_fills: dict[str, str] | None = None,
) -> None:
    """Move generated objects from staging slides into real owner parts.

    ``masters`` maps Typst declaration names to staging slide part names.
    ``layouts`` maps declaration names to ``(master name, staging slide part)``.
    ``slide_layouts`` maps actual slide part names to layout declaration names.
    The staging slides are removed from the final package.
    """
    pptx_path = Path(pptx_path)
    masters = {name: part.lstrip("/") for name, part in masters.items()}
    layouts = {name: (master, part.lstrip("/")) for name, (master, part) in layouts.items()}
    slide_layouts = {part.lstrip("/"): layout for part, layout in slide_layouts.items()}
    stage_parts = {name: part.lstrip("/") for name, part in stage_parts.items()}
    layout_show_master = layout_show_master or {}
    master_fills = master_fills or {}
    layout_fills = layout_fills or {}
    slide_show_master = {part.lstrip("/"): value for part, value in (slide_show_master or {}).items()}
    with ZipFile(pptx_path, "r") as source:
        files = {name: source.read(name) for name in source.namelist()}

    presentation_path = "ppt/presentation.xml"
    presentation_rels_path = "ppt/_rels/presentation.xml.rels"
    pres = _xml(files[presentation_path])
    pres_rels = _xml(files[presentation_rels_path])
    content_types = _xml(files["[Content_Types].xml"])
    slide_list = pres.find("{%s}sldIdLst" % P)
    master_list = pres.find("{%s}sldMasterIdLst" % P)
    if slide_list is None or master_list is None:
        raise ValueError("Presentation package has no slide or master list")

    rel_targets = {r.get("Id"): r.get("Target") for r in pres_rels}
    master_rel = next((r for r in pres_rels if r.get("Type") == REL_MASTER), None)
    if master_rel is None:
        raise ValueError("Presentation package has no base slide master")
    base_master = str(PurePosixPath("ppt") / PurePosixPath(master_rel.get("Target")))
    base_master = str(PurePosixPath(base_master))
    if base_master.startswith("ppt/ppt/"):
        base_master = base_master[4:]
    master_num = max((int(x.stem.replace("slideMaster", "")) for x in map(PurePosixPath, files) if x.parent.as_posix() == "ppt/slideMasters" and x.stem.startswith("slideMaster") and x.stem.replace("slideMaster", "").isdigit()), default=0)
    layout_num = max((int(x.stem.replace("slideLayout", "")) for x in map(PurePosixPath, files) if x.parent.as_posix() == "ppt/slideLayouts" and x.stem.startswith("slideLayout") and x.stem.replace("slideLayout", "").isdigit()), default=0)

    # Determine actual slide part names and presentation relationship ids.
    actual_slide_parts = []
    stage_slide_parts = set(stage_parts.values())
    rel_to_slide = {}
    for rid, target in rel_targets.items():
        rel = _relationship(pres_rels, rid)
        if rel is None or rel.get("Type") != REL_SLIDE:
            continue
        part = str(PurePosixPath("ppt") / PurePosixPath(target))
        if part.startswith("ppt/ppt/"):
            part = part[4:]
        rel_to_slide[rid] = part
        if part not in stage_slide_parts:
            actual_slide_parts.append(part)

    # Create one layout part per declaration. Each layout is connected to its
    # owning master, and each master receives only its own generated layouts.
    master_parts = {}
    base_master_id = next((x for x in master_list if _relationship(pres_rels, x.get("{%s}id" % R)) is master_rel), None)
    if base_master_id is None:
        base_master_id = master_list[0]
    for index, name in enumerate(masters):
        if index == 0:
            master_parts[name] = base_master
            master_xml = _xml(files[base_master])
            _set_creation_ids(master_xml, part)
            master_rels = _xml(files[_rels_path(base_master)])
        else:
            master_num += 1
            part = f"ppt/slideMasters/slideMaster{master_num}.xml"
            master_parts[name] = part
            master_xml = _xml(files[base_master])
            master_rels = _xml(files[_rels_path(base_master)])
            # A separate theme part keeps masters independent in the package.
            theme_rel = next((r for r in master_rels if r.get("Type") == REL_THEME), None)
            if theme_rel is not None:
                target = posixpath.normpath(posixpath.join("ppt/slideMasters", theme_rel.get("Target")))
                theme_bytes = files[target]
                theme_path = f"ppt/theme/theme{master_num}.xml"
                files[theme_path] = theme_bytes
                theme_rel.set("Target", f"../theme/theme{master_num}.xml")
                files[_rels_path(theme_path)] = files.get(_rels_path(theme_path), _dump(_rels()))
                if not any(item.get("PartName") == "/" + theme_path for item in content_types):
                    override = etree.SubElement(content_types, "{%s}Override" % CT)
                    override.set("PartName", "/" + theme_path)
                    override.set("ContentType", "application/vnd.openxmlformats-officedocument.theme+xml")
            # Remove links to the default master's layouts. This master is
            # populated with only layouts declared beneath it.
            for rel in list(master_rels):
                if rel.get("Type") == REL_LAYOUT:
                    master_rels.remove(rel)
            layout_list = master_xml.find("{%s}sldLayoutIdLst" % P)
            if layout_list is not None:
                layout_list.clear()
            rid = f"rIdMaster{master_num}"
            _append_rel(pres_rels, rid, REL_MASTER, f"slideMasters/{PurePosixPath(part).name}")
            master_id = etree.SubElement(master_list, "{%s}sldMasterId" % P)
            master_id.set("id", str(2147483648 + master_num))
            master_id.set("{%s}id" % R, rid)
            files[part] = _dump(master_xml)
            files[_rels_path(part)] = _dump(master_rels)
            override = etree.SubElement(content_types, "{%s}Override" % CT)
            override.set("PartName", "/" + part)
            override.set("ContentType", "application/vnd.openxmlformats-officedocument.presentationml.slideMaster+xml")

    layout_parts = {}
    layout_relationships_by_master = {name: [] for name in masters}
    blank_layout = "ppt/slideLayouts/slideLayout7.xml"
    if blank_layout not in files:
        blank_layout = next((p for p in files if p.startswith("ppt/slideLayouts/slideLayout") and p.endswith(".xml") and p != _rels_path(p)), None)
    for index, (name, (master_name, stage_part)) in enumerate(layouts.items(), 1):
        layout_num += 1
        part = f"ppt/slideLayouts/slideLayout{layout_num}.xml"
        layout_parts[name] = part
        layout_xml = _xml(files[blank_layout])
        _set_creation_ids(layout_xml, part)
        layout_root = layout_xml.find("{%s}cSld" % P)
        layout_xml.set("showMasterSp", "0" if layout_show_master.get(name) is False else "1")
        _set_solid_background(layout_xml, layout_fills.get(name, 'none'))
        tree = layout_xml.find("{%s}cSld/{%s}spTree" % (P, P))
        if tree is not None:
            for existing in list(tree)[2:]:
                tree.remove(existing)
        if layout_root is not None:
            layout_root.set("name", name)
        # Copy only editable objects from the staging slide into the layout.
        _move_stage_shapes(files, stage_part, part, layout_xml)
        layout_rels = _rels(files.get(_rels_path(part)))
        target = "../slideMasters/" + PurePosixPath(master_parts[master_name]).name
        _append_rel(layout_rels, "rId1", REL_MASTER, target)
        files[part] = _dump(layout_xml)
        files[_rels_path(part)] = _dump(layout_rels)
        override = etree.SubElement(content_types, "{%s}Override" % CT)
        override.set("PartName", "/" + part)
        override.set("ContentType", "application/vnd.openxmlformats-officedocument.presentationml.slideLayout+xml")
        layout_relationships_by_master[master_name].append((name, part))

    # Register layouts on their masters and remap visible slides to the selected
    # layout. Keep relationship ids local to each owning part.
    next_layout_id = 2147483648 + layout_num + 100
    for master_name, owned in layout_relationships_by_master.items():
        part = master_parts[master_name]
        root = _xml(files[part])
        relroot = _xml(files[_rels_path(part)])
        listing = root.find("{%s}sldLayoutIdLst" % P)
        if listing is None:
            listing = etree.Element("{%s}sldLayoutIdLst" % P)
            root.insert(0, listing)
        if part == base_master:
            # The generated slides no longer use python-pptx's stock layouts.
            # Remove those links and package parts so the layout picker exposes
            # only the layouts represented by explicit Typst declarations.
            for rel in list(relroot):
                if rel.get("Type") != REL_LAYOUT:
                    continue
                old_layout = posixpath.normpath(posixpath.join("ppt/slideMasters", rel.get("Target")))
                relroot.remove(rel)
                files.pop(old_layout, None)
                files.pop(_rels_path(old_layout), None)
                for override in list(content_types):
                    if override.get("PartName") == "/" + old_layout:
                        content_types.remove(override)
            listing.clear()
        for name, layout_part in owned:
            rid = f"rIdLayout{next_layout_id}"
            _append_rel(relroot, rid, REL_LAYOUT, "../slideLayouts/" + PurePosixPath(layout_part).name)
            item = etree.SubElement(listing, "{%s}sldLayoutId" % P)
            item.set("id", str(next_layout_id))
            item.set("{%s}id" % R, rid)
            next_layout_id += 1
        files[part] = _dump(root)
        files[_rels_path(part)] = _dump(relroot)

    for name, stage_part in masters.items():
        part = master_parts[name]
        root = _xml(files[part])
        _set_solid_background(root, master_fills.get(name, 'none'))
        _move_stage_shapes(files, stage_part, part, root)
        files[part] = _dump(root)

    for slide_part, layout_name in slide_layouts.items():
        relpath = _rels_path(slide_part)
        root = _xml(files[relpath])
        rel = next((r for r in root if r.get("Type") == REL_LAYOUT), None)
        if rel is None:
            raise ValueError(f"Slide {slide_part} has no slide-layout relationship")
        rel.set("Target", "../slideLayouts/" + PurePosixPath(layout_parts[layout_name]).name)
        files[relpath] = _dump(root)
        if slide_part in slide_show_master:
            slide_xml = _xml(files[slide_part])
            slide_xml.set("showMasterSp", "0" if not slide_show_master[slide_part] else "1")
            files[slide_part] = _dump(slide_xml)

    # Remove temporary staging slides and their package entries.
    for rid, part in list(rel_to_slide.items()):
        if part not in stage_slide_parts:
            continue
        rel = _relationship(pres_rels, rid)
        if rel is not None:
            pres_rels.remove(rel)
        for sld_id in list(slide_list):
            if sld_id.get("{%s}id" % R) == rid:
                slide_list.remove(sld_id)
        files.pop(part, None)
        files.pop(_rels_path(part), None)
        for override in list(content_types):
            if override.get("PartName") == "/" + part:
                content_types.remove(override)

    files[presentation_path] = _dump(pres)
    files[presentation_rels_path] = _dump(pres_rels)
    files["[Content_Types].xml"] = _dump(content_types)
    temp_path = pptx_path.with_suffix(pptx_path.suffix + ".tmp")
    with ZipFile(temp_path, "w", ZIP_DEFLATED) as output:
        for name, data in files.items():
            output.writestr(name, data)
    temp_path.replace(pptx_path)


def _set_solid_background(owner_xml, expression: str) -> None:
    """Write the converter's supported explicit RGB background value."""
    if not expression or expression.strip() == "none":
        return
    import re
    if "gradient." in expression:
        return  # caller reports gradients as a bounded unsupported case
    match = re.search(r"#([0-9a-fA-F]{6})([0-9a-fA-F]{2})?", expression)
    if not match:
        return
    cSld = owner_xml.find("{%s}cSld" % P)
    if cSld is None:
        return
    old = cSld.find("{%s}bg" % P)
    if old is not None:
        cSld.remove(old)
    bg = etree.Element("{%s}bg" % P)
    props = etree.SubElement(bg, "{%s}bgPr" % P)
    solid = etree.SubElement(props, "{%s}solidFill" % ("http://schemas.openxmlformats.org/drawingml/2006/main"))
    color = etree.SubElement(solid, "{%s}srgbClr" % ("http://schemas.openxmlformats.org/drawingml/2006/main"))
    color.set("val", match.group(1).upper())
    if match.group(2):
        alpha = etree.SubElement(color, "{%s}alpha" % ("http://schemas.openxmlformats.org/drawingml/2006/main"))
        alpha.set("val", str(round(int(match.group(2), 16) / 255 * 100000)))
    etree.SubElement(props, "{%s}effectLst" % ("http://schemas.openxmlformats.org/drawingml/2006/main"))
    cSld.insert(0, bg)


def _set_creation_ids(owner_xml, part: str) -> None:
    token = int.from_bytes(hashlib.sha256(part.encode("utf-8")).digest()[:4], "big") or 1
    for node in owner_xml.xpath("//*[local-name()='creationId']"):
        node.set("val", str(token))
        token = (token + 1) % 4294967295 or 1


def _move_stage_shapes(files: dict[str, bytes], stage_part: str, owner_part: str, owner_xml) -> None:
    """Copy staged shapes and scope any image relationship to the destination."""
    stage_xml = _xml(files[stage_part])
    stage_tree = stage_xml.find("{%s}cSld/{%s}spTree" % (P, P))
    owner_tree = owner_xml.find("{%s}cSld/{%s}spTree" % (P, P))
    if stage_tree is None or owner_tree is None:
        raise ValueError("A staging or owner part has no shape tree")
    stage_rels = _rels(files.get(_rels_path(stage_part)))
    owner_rels = _rels(files.get(_rels_path(owner_part)))
    next_rel = 1
    existing_ids = [int(value) for value in owner_tree.xpath(".//p:cNvPr/@id", namespaces={"p": P}) if value.isdigit()]
    next_shape_id = max(existing_ids, default=0) + 1
    for child in list(stage_tree)[2:]:
        shape = deepcopy(child)
        for c_nv_pr in shape.xpath(".//p:cNvPr", namespaces={"p": P}):
            c_nv_pr.set("id", str(next_shape_id))
            next_shape_id += 1
        for node in shape.iter():
            for attr in ("{%s}embed" % R, "{%s}link" % R):
                old = node.get(attr)
                if not old:
                    continue
                source_rel = _relationship(stage_rels, old)
                if source_rel is None or source_rel.get("Type") != REL_IMAGE:
                    continue
                rid = f"rIdMedia{next_rel}"
                next_rel += 1
                target = source_rel.get("Target")
                _append_rel(owner_rels, rid, REL_IMAGE, target)
                node.set(attr, rid)
        owner_tree.append(shape)
    files[_rels_path(owner_part)] = _dump(owner_rels)
