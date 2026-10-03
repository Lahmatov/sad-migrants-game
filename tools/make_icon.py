#!/usr/bin/env python3
"""Иконка приложения в пикселях: чемодан «23» и серый кот на фоне сумерек над морем.

    python3 tools/make_icon.py

Рисуется на сетке 64×64 из палитры Endesga 32 и увеличивается в 16 раз
без сглаживания — 1024×1024, как просит App Store.
"""
import os
from PIL import Image

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, 'App', 'Resources', 'Assets.xcassets', 'AppIcon.appiconset', 'AppIcon.png')

C = {
    'night': (0x18, 0x14, 0x25), 'navy': (0x26, 0x2b, 0x44), 'purple': (0x68, 0x38, 0x6c),
    'plum': (0x3e, 0x27, 0x31), 'magenta': (0xb5, 0x50, 0x88), 'tangerine': (0xf7, 0x76, 0x22),
    'gold': (0xfe, 0xae, 0x34), 'lemon': (0xfe, 0xe7, 0x61), 'ocean': (0x12, 0x4e, 0x89),
    'deep': (0x19, 0x3c, 0x3e), 'cloud': (0xc0, 0xcb, 0xdc), 'white': (0xff, 0xff, 0xff),
    'rust': (0xbe, 0x4a, 0x2f), 'brown': (0x73, 0x3e, 0x39), 'sand': (0xea, 0xd4, 0xaa),
    'mist': (0x8b, 0x9b, 0xb4), 'steel': (0x5a, 0x69, 0x88),
}
DIGITS = {'2': ['111', '001', '111', '100', '111'], '3': ['111', '001', '111', '001', '111']}


def draw():
    img = Image.new('RGB', (64, 64), C['night'])
    px = img.load()

    def rect(x, y, w, h, color):
        for i in range(x, x + w):
            for j in range(y, y + h):
                if 0 <= i < 64 and 0 <= j < 64:
                    px[i, j] = C[color]

    # Сумерки полосами, с шахматной кромкой — как небо в живых сценах.
    bands = ['night', 'navy', 'purple', 'magenta', 'tangerine']
    for k, color in enumerate(bands):
        rect(0, k * 7, 64, 7, color)
        if k:
            for x in range(k % 2, 64, 2):
                px[x, k * 7 - 1] = C[color]
    for x, y in [(6, 3), (19, 6), (52, 2), (40, 8), (11, 10)]:
        px[x, y] = C['cloud']
    # Солнце садится в море.
    for dy in range(-5, 6):
        half = int((25 - dy * dy) ** 0.5)
        rect(8 - half, 33 + dy, half * 2 + 1, 1, 'gold')
    # Море: тёмное, с дорожкой от солнца.
    rect(0, 35, 64, 29, 'ocean')
    rect(0, 48, 64, 16, 'deep')
    for y in range(37, 62, 3):
        rect(5 + (y % 2), y, 6, 1, 'lemon')
        for x in range(20 + (y * 7) % 9, 64, 11):
            rect(x, y, 3, 1, 'cloud')
    # Чемодан.
    rect(15, 30, 30, 24, 'rust')
    rect(15, 30, 30, 1, 'brown')
    rect(15, 53, 30, 1, 'brown')
    rect(21, 30, 2, 24, 'brown')
    rect(37, 30, 2, 24, 'brown')
    rect(25, 26, 10, 2, 'night')
    rect(25, 26, 2, 4, 'night')
    rect(33, 26, 2, 4, 'night')
    # «23» на боку чемодана.
    for n, digit in enumerate('23'):
        for row, bits in enumerate(DIGITS[digit]):
            for col, bit in enumerate(bits):
                if bit == '1':
                    rect(24 + n * 8 + col * 2, 37 + row * 2, 2, 2, 'sand')
    # Серый кот сидит на чемодане.
    rect(38, 22, 6, 8, 'mist')
    rect(38, 20, 2, 2, 'mist')
    rect(42, 20, 2, 2, 'mist')
    rect(44, 26, 2, 4, 'mist')
    px[39, 24] = C['night']
    px[42, 24] = C['night']
    return img.resize((1024, 1024), Image.NEAREST)


if __name__ == '__main__':
    draw().save(OUT)
    print(f'Иконка: {os.path.relpath(OUT, ROOT)}')
