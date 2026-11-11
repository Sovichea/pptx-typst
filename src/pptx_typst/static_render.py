"""Export explicitly marked native artwork without rewriting its authored source."""
import hashlib
import json
from pathlib import Path
import re
import tempfile

from .engine import compile_document


def code_mask(source):
    """Keep token positions while hiding strings, comments and raw text."""
    out = list(source)
    i = 0
    while i < len(source):
        start = i
        if source.startswith('//', i):
            end = source.find('\n', i)
            i = len(source) if end < 0 else end
        elif source.startswith('/*', i):
            i += 2
            depth = 1
            while i < len(source) and depth:
                if source.startswith('/*', i): depth += 1; i += 2
                elif source.startswith('*/', i): depth -= 1; i += 2
                else: i += 1
        elif source[i] == '"':
            i += 1
            while i < len(source):
                if source[i] == '\\': i += 2
                elif source[i] == '"': i += 1; break
                else: i += 1
        elif source[i] == '`':
            ticks = re.match(r'`+', source[i:]).group()
            end = source.find(ticks, i + len(ticks))
            i = len(source) if end < 0 else end + len(ticks)
        elif source[i] == '\\':
            i += 2
        else:
            i += 1
            continue
        for n in range(start, min(i, len(out))):
            if out[n] != '\n': out[n] = ' '
    return ''.join(out)


def balanced_end(mask, start):
    stack = []
    for i in range(start, len(mask)):
        char = mask[i]
        if char in '([{': stack.append({'(': ')', '[': ']', '{': '}'}[char])
        elif char in ')]}':
            if not stack or stack.pop() != char: raise ValueError('unbalanced static artwork')
            if not stack: return i + 1
    raise ValueError('unterminated static artwork')


def materialize(source, content, font_paths=()):
    from .typst_to_pptx import kwargs
    mask = code_mask(content)
    first = re.search(r'#(?:PptxSlide|Root)\s*\(', mask)
    preamble = content[:first.start()] if first else ''
    edits = []
    for match in re.finditer(r'\bPptxStatic\s*\(', mask):
        if edits and match.start() < edits[-1][1]: continue
        end = balanced_end(mask, match.end() - 1)
        body_start = end
        while body_start < len(mask) and mask[body_start].isspace(): body_start += 1
        if body_start >= len(mask) or mask[body_start] != '[': continue
        body_end = balanced_end(mask, body_start)
        args = kwargs(content[match.end():end - 1])
        def dimension(name):
            value = args.get(name, '')
            if not re.fullmatch(r'\d+(?:\.\d+)?pt', value) or float(value[:-2]) <= 0:
                raise ValueError(f'PptxStatic requires a positive literal {name} in pt')
            return float(value[:-2])
        width, height = dimension('width'), dimension('height')
        body = content[body_start + 1:body_end - 1]
        digest = hashlib.sha256((preamble + content[match.start():body_end] + repr(list(font_paths))).encode()).hexdigest()[:20]
        relative = f'assets/static/{digest}.svg'
        target = source.parent / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        wrapper = preamble + f'\n#set page(width: {width}pt, height: {height}pt, margin: 0pt, fill: none, header: none, footer: none)\n#block(width: {width}pt, height: {height}pt, clip: true)[{body}]'
        with tempfile.NamedTemporaryFile(mode='w', suffix='.typ', prefix='.pptx-static-',
                                         dir=source.parent, encoding='utf-8', delete=False) as temporary:
            temporary.write(wrapper)
            path = Path(temporary.name)
        try:
            compile_document(path, target, format='svg', font_paths=font_paths, root=source.parent)
            compile_document(path, target.with_suffix('.png'), format='png', ppi=144,
                             font_paths=font_paths, root=source.parent)
        except Exception as exc:
            raise ValueError(f'PptxStatic SVG export failed: {exc}') from exc
        finally:
            path.unlink(missing_ok=True)
        replacement = f'image({json.dumps(relative)}, width: {width}pt, height: {height}pt)'
        edits.append((match.start(), body_end, replacement))
    for start, end, replacement in reversed(edits):
        content = content[:start] + replacement + content[end:]
    return content, len(edits)
