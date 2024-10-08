import os
import random as rnd
from typing import Any

COLOR_DIR = os.path.abspath("./palette-csv/color-experiments")

SIZE = 8
COL_WIDTH = SIZE * 12
ROW_HEIGHT = SIZE * 4
TEXT_SIZE = (2 * SIZE) // 3


def generate_unique_pairs(
    list1: list[Any] | list[list[Any]], list2: list[Any]
) -> list[list[Any]]:
    if isinstance(list1[0], list):
        pairs = [item1 + [item2] for item1 in list1 for item2 in list2]
    else:
        pairs = [[item1, item2] for item1 in list1 for item2 in list2]
    return pairs


def load_colors(dir: str) -> dict[str, list[str]]:
    dir = os.path.abspath(dir)
    dir = os.path.abspath(dir)
    print(dir)

    ls = os.listdir(dir)
    print(ls)
    files: list[str] = list()
    for f in ls:
        f_path = os.path.abspath(os.path.join(dir, f))
        print(f_path)
        if (
            os.path.exists(f_path)
            and os.path.isfile(f_path)
            and os.path.basename(f_path).endswith(".csv")
        ):
            files.append(f_path)

    result: dict[str, list[str]] = dict()
    for f_path in files:
        with open(f_path) as f:
            result[os.path.basename(f_path).replace(".csv", "")] = f.readlines()

    return result


def generate_svg(colors: list[list[str]]) -> str:
    print(len(colors))
    rnd.shuffle(colors)

    def svg_square(height: int, width: int, x: int, y: int, color: str, r: int) -> str:
        return (
            '<rect width="'
            + str(width)
            + '" height="'
            + str(height)
            + '" x="'
            + str(x)
            + '" y="'
            + str(y)
            + '" rx="'
            + str(r)
            + '" ry="'
            + str(r)
            + '" fill="'
            + color
            + 'ff" />\n'
        )

    def svg_text(size: int, x: int, y: int, color: str) -> str:
        return (
            '<text x="'
            + str(x + TEXT_SIZE)
            + '" y="'
            + str(y + ((2 * ROW_HEIGHT) // 3))
            + '" fill="'
            + color
            + 'ff" font="bold '
            + str(size)
            + 'px mono">'
            + color
            + "</text>"
        )

    def svg_single_palette(palette: list[str], x: int, y: int) -> tuple[str, int, int]:
        svg_content: str = ""
        og_x, og_y = x, y
        fin_x, fin_y = x, y

        for i in range(0, len(palette)):
            svg_content = svg_content + svg_square(
                ROW_HEIGHT, COL_WIDTH, x, y + i * ROW_HEIGHT, palette[0], 0
            )
            svg_content = svg_content + svg_square(
                ROW_HEIGHT, COL_WIDTH, x + COL_WIDTH, y + i * ROW_HEIGHT, palette[1], 0
            )
            svg_content = svg_content + svg_text(
                TEXT_SIZE, x, y + i * ROW_HEIGHT, palette[i]
            )
            svg_content = svg_content + svg_text(
                TEXT_SIZE, x + COL_WIDTH, y + i * ROW_HEIGHT, palette[i]
            )
            fin_x = x + (COL_WIDTH * 2)
            fin_y = y + ((i + 1) * ROW_HEIGHT)

        return svg_content, fin_x - og_x, fin_y - og_y

    svg_content: str = ""
    x, y = 0, 0
    t_x, t_y = x, y
    x_o = 1
    for p in colors:
        t_svg, t_x, t_y = svg_single_palette(p, x, y)
        svg_content = svg_content + t_svg
        if x_o % 40 == 0:
            y = y + t_y
            x_o = 1
            x = 0
        else:
            x = x + t_x
            x_o = x_o + 1

    svg_content = (
        '<svg width="'
        + str(x)
        + '" height="'
        + str(y)
        + '" xmlns="http://www.w3.org/2000/svg">\n'
        + svg_content
        + "</svg>"
    )

    return svg_content


def main():
    colors: dict[str, list[str]] = dict()
    colors = load_colors(COLOR_DIR)

    for k in colors.keys():
        for i in range(0, len(colors[k])):
            colors[k][i] = colors[k][i].strip()

    colors_combi = generate_unique_pairs(colors["dark"], colors["light"])
    for k in colors.keys():
        if k == "dark" or k == "light":
            continue
        colors_combi = generate_unique_pairs(colors_combi, colors[k])

    svg_to_write = generate_svg(colors_combi)
    with open(
        os.path.join(COLOR_DIR, "palettes.svg"),
        "w",
    ) as file:
        _ = file.write(svg_to_write)


if __name__ == "__main__":
    main()
