"""Guarded native source recovery and deduplicated OPC source dependencies."""
import base64
import hashlib
import json
from pathlib import Path
import re

from lxml import etree
from pptx import Presentation
from pptx.opc.package import Part
from pptx.opc.packuri import PackURI

REL = 'https://pptx-typst.org/relationships/source'
IMAGE_REL = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'
ASVG = 'http://schemas.microsoft.com/office/drawing/2016/SVG/main'
R = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def embed_svg(slide, picture, path):
    blob = path.read_bytes()
    package = slide.part.package
    part = next((p for p in package.iter_parts() if p.content_type == 'image/svg+xml' and p.blob == blob), None)
    if part is None:
        part = Part(PackURI('/ppt/media/native-' + digest(blob) + '.svg'), 'image/svg+xml', package, blob)
    rel = slide.part.relate_to(part, IMAGE_REL)
    blip = picture._element.blipFill.blip
    ext_list = etree.SubElement(blip, '{http://schemas.openxmlformats.org/drawingml/2006/main}extLst')
    ext = etree.SubElement(ext_list, '{http://schemas.openxmlformats.org/drawingml/2006/main}ext',
                           uri='{96DAC541-7B7A-43D3-8B79-37D633B846F1}')
    etree.SubElement(ext, '{' + ASVG + '}svgBlip', {'{' + R + '}embed': rel}, nsmap={'asvg': ASVG})


def state(prs):
    """Hash visible XML, inheritance, media, and links; exclude source and save metadata."""
    def tree(node, part):
        if etree.QName(node).localname in {'creationId', 'modId'}: return None
        attributes = []
        for key, value in node.attrib.items():
            if key.startswith('{' + R + '}') and value in part.rels:
                rel = part.rels[value]
                if rel.is_external: value = [rel.reltype, rel.target_ref]
                elif rel.reltype.endswith(('/slideLayout', '/slideMaster')): value = rel.reltype
                else: value = [rel.reltype, digest(rel.target_part.blob)]
            attributes.append((key, value))
        return [node.tag, sorted(attributes), node.text if node.text and node.text.strip() else None,
                [v for child in node if (v := tree(child, part)) is not None]]
    slides = []
    for slide in prs.slides:
        owners = [slide.part, slide.slide_layout.part, slide.slide_layout.slide_master.part]
        theme = next((rel.target_part for rel in owners[-1].rels.values()
                      if rel.reltype.endswith('/theme') and not rel.is_external), None)
        if theme is not None: owners.append(theme)
        notes = slide.notes_slide.notes_text_frame.text if slide.has_notes_slide and slide.notes_slide.notes_text_frame else ''
        slides.append([[tree(etree.fromstring(p.blob), p) for p in owners], notes])
    return digest(json.dumps([prs.slide_width, prs.slide_height, slides], sort_keys=True).encode())


def dependencies(source):
    base = source.parent.resolve()
    files, modules = {}, []
    def collect(path):
        path = path.resolve()
        if not path.is_relative_to(base) or not path.is_file(): return
        name = path.relative_to(base).as_posix()
        if name in files or path == source: return
        data = path.read_bytes()
        files[name] = data
        if path.suffix == '.typ': scan(path.parent, data.decode('utf-8-sig'))
    def scan(parent, text):
        modules.append((parent, text))
        for match in re.finditer(r'"([^"\r\n]+)"', text): collect(parent / match[1])
    scan(base, source.read_text(encoding='utf-8-sig'))
    # image(path) resolves relative to the helper's module, not the caller.
    references = {m[1] for _, text in modules for m in re.finditer(r'"([^"\r\n]+)"', text)}
    for parent, _ in list(modules):
        for name in references: collect(Path(parent) / name)
    return files


def attach(source, output):
    prs = Presentation(output)
    package = prs.part.package
    manifest = {'version': 1, 'entry': base64.b64encode(source.read_bytes()).decode(),
                'filename': source.name, 'entry_sha256': digest(source.read_bytes()), 'baseline': state(prs), 'files': {}}
    part = Part(PackURI('/pptxTypst/source.json'), 'application/json', package, b'')
    prs.part.relate_to(part, REL)
    media = {digest(p.blob) for p in package.iter_parts() if p.content_type.startswith('image/')}
    private = {}
    for name, blob in dependencies(source).items():
        if name.endswith('.typ'):
            record = {'text': base64.b64encode(blob).decode(), 'sha256': digest(blob)}
        else:
            sha = digest(blob)
            record = {'sha256': sha}
            if sha not in media and sha not in private:
                asset = Part(PackURI('/pptxTypst/assets/' + sha + '.bin'), 'application/octet-stream', package, blob)
                part.relate_to(asset, REL + '/asset')
                private[sha] = asset
        manifest['files'][name] = record
    part._blob = json.dumps(manifest, ensure_ascii=False).encode()
    prs.save(output)


def restore(source, output, *, enabled=True):
    prs = Presentation(source)
    rel = next((r for r in prs.part.rels.values() if r.reltype == REL and not r.is_external), None)
    if rel is None: return {'source_restoration': 'unavailable', 'warnings': []}
    if not enabled:
        return {'source_restoration': 'reconstructed', 'warnings': ['source restoration explicitly disabled']}
    try:
        manifest = json.loads(rel.target_part.blob)
    except (ValueError, UnicodeDecodeError):
        return {'source_restoration': 'reconstructed', 'warnings': ['invalid native source manifest']}
    if not isinstance(manifest, dict):
        return {'source_restoration': 'reconstructed', 'warnings': ['invalid native source manifest']}
    reason = None
    if manifest.get('version') != 1: reason = 'unsupported native source package version'
    elif manifest.get('baseline') != state(prs): reason = 'PowerPoint content or layout changed; stale source was not restored'
    if reason: return {'source_restoration': 'reconstructed', 'warnings': [reason]}
    files = {'main.typ': base64.b64decode(manifest['entry'], validate=True)}
    if digest(files['main.typ']) != manifest.get('entry_sha256'):
        raise ValueError('native source entry checksum mismatch')
    blobs = {digest(p.blob): p.blob for p in prs.part.package.iter_parts()
             if p.content_type.startswith('image/') or str(p.partname).startswith('/pptxTypst/assets/')}
    for name, record in manifest['files'].items():
        if 'text' in record:
            files[name] = base64.b64decode(record['text'], validate=True)
            if digest(files[name]) != record.get('sha256'): raise ValueError('native source dependency checksum mismatch')
        elif record.get('sha256') in blobs: files[name] = blobs[record['sha256']]
        else: return {'source_restoration': 'reconstructed', 'warnings': ['original dependency missing or changed: ' + name]}
    root = output.resolve()
    # Validate every destination before writing any source files.
    for name in files:
        if name == 'main.typ' and name in manifest['files']: raise ValueError('source dependency collides with restored entrypoint')
        if Path(name).is_absolute() or not (root / name).resolve().is_relative_to(root):
            raise ValueError('native source path escapes output directory')
    for name, blob in files.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(blob)
    report = {'source_restoration': 'exact', 'source_file': source.name, 'slides': len(prs.slides),
              'status': 'completed', 'warnings': []}
    (root / 'conversion_report.json').write_text(json.dumps(report, indent=2), encoding='utf-8')
    return report
