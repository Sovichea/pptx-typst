"""Conservative local file discovery for recoverable Typst snapshots.

This is not a Typst evaluator. Unresolved file operations disable exact recovery
rather than guessing which quoted strings might name private files.
"""
import json
from pathlib import Path
import re


class IncompleteDependencies(ValueError):
    pass


READERS = {'image', 'PptxImage', 'read', 'csv', 'json', 'yaml', 'toml', 'xml',
           'cbor', 'bibliography'}
IDENTIFIER = re.compile(r'[\w-]+')
STRING = re.compile(r'"(?:\\.|[^"\\])*"')


def code_tokens(text):
    """Visit code, including code inside markup, excluding prose and comments."""
    tokens = []

    def ignored(i):
        if text.startswith('//', i):
            end = text.find('\n', i)
            return len(text) if end < 0 else end
        if text.startswith('/*', i):
            depth = 1
            i += 2
            while i < len(text) and depth:
                if text.startswith('/*', i): depth += 1; i += 2
                elif text.startswith('*/', i): depth -= 1; i += 2
                else: i += 1
            return i
        if text[i] == '`':
            ticks = re.match(r'`+', text[i:])[0]
            end = text.find(ticks, i + len(ticks))
            return len(text) if end < 0 else end + len(ticks)
        return i

    def markup(i, closing=None):
        while i < len(text):
            if text[i] == closing:
                return i + 1
            end = ignored(i)
            if end != i:
                i = end
            elif text[i] == '\\':
                i += 2
            elif text[i] == '#':
                keyword = IDENTIFIER.match(text, i + 1)
                statement = keyword and keyword[0] in {'let', 'set', 'show', 'import', 'include'}
                tokens.append('|')
                i = code(i + 1, statement=statement)
                tokens.append('|')
            else:
                i += 1
        return i

    def code(i, closing=None, statement=False):
        atom = False
        while i < len(text):
            char = text[i]
            if char == closing:
                tokens.append(char)
                return i + 1
            end = ignored(i)
            if end != i:
                i = end
                continue
            if char.isspace():
                if (closing is None and char == '\n'
                        and (not tokens or tokens[-1] not in {'=', ','}) and tokens[-2:] != ['=', '>']):
                    return i + 1
                i += 1
                continue
            if closing is None and atom and not statement and char not in '([.' and tokens[-1] != '.':
                return i
            match = STRING.match(text, i) if char == '"' else IDENTIFIER.match(text, i)
            if match:
                tokens.append(match[0])
                i = match.end()
            elif char in '({':
                tokens.append(char)
                i = code(i + 1, closing={'(': ')', '{': '}'}[char])
            elif char == '[':
                tokens.append('|')
                i = markup(i + 1, closing=']')
                tokens.append('|')
            else:
                tokens.append(char)
                i += 1
            atom = True
        return i

    markup(0)
    return tokens


def literal_path(tokens):
    if len(tokens) != 1 or not tokens[0].startswith('"'):
        raise IncompleteDependencies('computed or indirect file dependency')
    try:
        literal = re.sub(r'\\u\{([0-9a-fA-F]+)\}',
                         lambda m: json.dumps(chr(int(m[1], 16)))[1:-1], tokens[0])
        return json.loads(literal)
    except (ValueError, OverflowError) as exc:
        raise IncompleteDependencies('unresolved file path escape') from exc


def dependencies(source):
    source = Path(source).resolve()
    base = source.parent
    files = {}
    scanned = set()

    def collect(parent, name, *, module=False):
        if name.startswith('@'):
            return  # Remote packages are deliberately not bundled.
        path = (base / name.lstrip('/') if name.startswith('/') else parent / name).resolve()
        if not path.is_relative_to(base) or not path.is_file():
            raise IncompleteDependencies('file dependency outside project or missing: ' + name)
        relative = path.relative_to(base).as_posix()
        if path == source:
            return
        if relative not in files:
            files[relative] = path.read_bytes()
        if module:
            scan(path)

    def scan(path):
        if path in scanned:
            return
        scanned.add(path)
        tokens = code_tokens(path.read_text(encoding='utf-8-sig'))
        for i, name in enumerate(tokens):
            if name in {'eval', 'plugin'} or (name == 'at' and tokens[max(0, i - 2):i] == ['std', '.']):
                raise IncompleteDependencies('dynamic code or file reader lookup')
            elif name in {'import', 'include'}:
                end = i + 2
                if end < len(tokens) and tokens[end] not in {':', '|', ';', '}'}:
                    raise IncompleteDependencies('computed import or include')
                collect(path.parent, literal_path(tokens[i + 1:end]), module=True)
            elif name in READERS:
                if tokens[i - 1:i] in (['set'], ['show']):
                    continue  # Styling a reader does not read a file.
                # The bundled image alias is recognized at its call sites.
                if name == 'PptxImage' and tokens[i - 1:i] == ['let'] and tokens[i + 1:i + 4] == ['=', 'image', '|']:
                    continue
                if tokens[max(0, i - 3):i] == ['let', 'PptxImage', '='] and name == 'image':
                    continue
                if i and tokens[i - 1] == 'let':
                    raise IncompleteDependencies('shadowed file reader: ' + name)
                if tokens[i + 1:i + 2] == ['.']:
                    raise IncompleteDependencies('indirect file reader: ' + name)
                if i and tokens[i - 1] == '.' and tokens[max(0, i - 2)] != 'std':
                    raise IncompleteDependencies('qualified file reader: ' + name)
                if tokens[i + 1:i + 2] != ['(']:
                    raise IncompleteDependencies('aliased file reader: ' + name)
                end = i + 2
                while end < len(tokens) and tokens[end] not in {',', ')', '|'}:
                    end += 1
                argument = tokens[i + 2:end]
                if argument[:2] == ['path', ':']:
                    argument = argument[2:]
                collect(path.parent, literal_path(argument))

    scan(source)
    return files
