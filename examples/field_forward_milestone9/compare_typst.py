#!/usr/bin/env python3
"""Create a handoff-reference versus rebuilt-Typst sheet for slides 4–7."""
from pathlib import Path

import fitz
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent
BEFORE = ROOT / "reference" / "before" / "Field_Forward_Corrected_Typst_Preview.pdf"
AFTER = ROOT / "preview.pdf"
OUTPUT = ROOT / "qa" / "source-vs-rebuilt-slides-4-7.png"


def main() -> None:
    reference = fitz.open(BEFORE)
    rebuilt = fitz.open(AFTER)
    if len(reference) != 8 or len(rebuilt) != 8:
        raise ValueError("Expected matching eight-page reference and rebuilt Typst PDFs")
    scale = 4 / 3
    rendered = []
    for page_index in range(3, 7):
        pair = []
        for document in (reference, rebuilt):
            pixmap = document[page_index].get_pixmap(matrix=fitz.Matrix(scale, scale), alpha=False)
            pair.append(Image.frombytes("RGB", (pixmap.width, pixmap.height), pixmap.samples))
        rendered.append(pair)

    width, height = rendered[0][0].size
    header = 46
    sheet = Image.new("RGB", (width * 2, (height + header) * 4), (242, 244, 244))
    draw = ImageDraw.Draw(sheet)
    try:
        font = ImageFont.truetype("C:/Windows/Fonts/arial.ttf", 24)
    except OSError:
        font = ImageFont.load_default()
    for row, (old, new) in enumerate(rendered):
        y = row * (height + header)
        draw.text((20, y + 10), f"Slide {row + 4} — handoff reference", font=font, fill=(30, 45, 42))
        draw.text((width + 20, y + 10), f"Slide {row + 4} — semantic rebuild", font=font, fill=(30, 45, 42))
        sheet.paste(old, (0, y + header))
        sheet.paste(new, (width, y + header))
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    sheet.save(OUTPUT)
    print(f"Wrote {OUTPUT}")


if __name__ == "__main__":
    main()
