"""In-process Typst rendering and compatibility for existing benchmark callers."""
from pathlib import Path
import os
import subprocess

import typst


def compile_document(source, output=None, *, font_paths=(), root=None, format=None, ppi=None):
    source = Path(source).resolve()
    return typst.compile(str(source), output=str(output) if output is not None else None,
                         root=str(Path(root).resolve()) if root else str(source.parent),
                         font_paths=[str(Path(p).resolve()) for p in font_paths], format=format, ppi=ppi)


def font_inventory(font_paths=()):
    return set(typst.Fonts(font_paths=[str(Path(p).resolve()) for p in font_paths]).families())


def run_typst(command, *, cwd=None, check=False, **_legacy_options):
    """Run former CLI compile/fonts requests with typst-py, never a subprocess."""
    directory = Path(cwd or Path.cwd())
    args = list(map(str, command[1:]))
    operation = args.pop(0)
    paths, positional, options = [], [], {}
    while args:
        arg = args.pop(0)
        if arg == '--font-path':
            paths.extend(directory / p for p in args.pop(0).split(os.pathsep))
        elif arg in {'--root', '--format', '--ppi'}:
            options[arg[2:]] = args.pop(0)
        else:
            positional.append(arg)
    try:
        if operation == 'fonts':
            output = '\n'.join(sorted(font_inventory(paths))) + '\n'
        elif operation == 'compile':
            if 'root' in options:
                options['root'] = directory / options['root']
            if 'ppi' in options:
                options['ppi'] = float(options['ppi'])
            target = directory / positional[1] if len(positional) > 1 else (directory / positional[0]).with_suffix('.pdf')
            compile_document(directory / positional[0], target, font_paths=paths, **options)
            output = ''
        else:
            raise ValueError(f'unsupported typst-py operation: {operation}')
        result = subprocess.CompletedProcess(command, 0, stdout=output, stderr='')
    except (typst.TypstError, OSError, ValueError) as exc:
        result = subprocess.CompletedProcess(command, 1, stdout='', stderr=str(exc))
    if check:
        result.check_returncode()
    return result
