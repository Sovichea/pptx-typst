import pytest

from pptx_typst.drawingml_fills import A, linear_gradient


def test_linear_gradient_retains_stops_alpha_and_angle():
    fill = linear_gradient('gradient.linear((rgb("#E8E8E8"),0%),(rgb("#CCCFD5A6"),59%),'
                           '(rgb("#CCCFD5A6"),100%),angle:359.9deg)')
    stops = fill.findall('.//{' + A + '}gs')
    assert [s.get('pos') for s in stops] == ['0', '59000', '100000']
    assert [s[0].get('val') for s in stops] == ['E8E8E8', 'CCCFD5', 'CCCFD5']
    assert stops[1][0][0].get('val') == str(round(166 / 255 * 100000))
    assert fill.find('{' + A + '}lin').get('ang') == '21594000'


@pytest.mark.parametrize('expression', [
    'gradient.radial(red, blue)',
    'gradient.linear(red, blue, angle: 0deg)',
    'gradient.linear((rgb("#FFFFFF"),100%),(rgb("#000000"),0%),angle:0deg)',
    'gradient.linear((rgb("#FFFFFF"),0%),(rgb("#000000"),110%),angle:0deg)',
])
def test_unhandled_gradient_is_not_silently_approximated(expression):
    assert linear_gradient(expression) is None
