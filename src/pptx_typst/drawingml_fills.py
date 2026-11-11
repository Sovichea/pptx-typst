"""Native DrawingML for the explicit linear gradients emitted by the importer."""
import re

from lxml import etree

A = 'http://schemas.openxmlformats.org/drawingml/2006/main'
STOP = re.compile(r'\(\s*rgb\("#([0-9a-fA-F]{6}(?:[0-9a-fA-F]{2})?)"\)\s*,\s*(\d+(?:\.\d+)?)%\s*\)')


def linear_gradient(expression):
    match = re.fullmatch(r'gradient\.linear\((.*),\s*angle:\s*([-+]?\d+(?:\.\d+)?)deg\s*\)',
                         expression.strip(), re.S)
    if not match:
        return None
    stops = STOP.findall(match[1])
    if len(stops) < 2 or STOP.sub('', match[1]).strip(' ,\t\r\n'):
        return None
    positions = [float(position) for _, position in stops]
    if positions != sorted(positions) or positions[0] < 0 or positions[-1] > 100:
        return None
    fill = etree.Element('{' + A + '}gradFill', rotWithShape='1')
    listing = etree.SubElement(fill, '{' + A + '}gsLst')
    for (color, _), position in zip(stops, positions):
        stop = etree.SubElement(listing, '{' + A + '}gs', pos=str(round(position * 1000)))
        value = etree.SubElement(stop, '{' + A + '}srgbClr', val=color[:6].upper())
        if len(color) == 8:
            etree.SubElement(value, '{' + A + '}alpha', val=str(round(int(color[6:], 16) / 255 * 100000)))
    etree.SubElement(fill, '{' + A + '}lin', ang=str(round((float(match[2]) % 360) * 60000)), scaled='1')
    return fill
