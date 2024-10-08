import os
from math import floor

CELL_SIZE = 16 * 4
TEXT_SIZE = 8 * 3
BORDER_SIZE = 8 * 4
PALETTE_DIR = "./palette-csv"

ANSI_CODE: dict[str, int] = {
    "BACKGROUND": -1,
    "FOREGROUND": -2,
    "REGULAR_BLACK": 0,
    "REGULAR_RED": 1,
    "REGULAR_GREEN": 2,
    "REGULAR_YELLOW": 3,
    "REGULAR_BLUE": 4,
    "REGULAR_MAGENTA": 5,
    "REGULAR_CYAN": 6,
    "REGULAR_WHITE": 7,
    "BRIGHT_BLACK": 8,
    "BRIGHT_RED": 9,
    "BRIGHT_GREEN": 10,
    "BRIGHT_YELLOW": 11,
    "BRIGHT_BLUE": 12,
    "BRIGHT_MAGENTA": 13,
    "BRIGHT_CYAN": 14,
    "BRIGHT_WHITE": 15,
}


class Color:
    def __init__(self, name: str, r: int, g: int, b: int, hex: str) -> None:
        self.r = r
        self.g = g
        self.b = b
        self.hex = hex
        self.name = name
        self.ansi_code = ANSI_CODE[name]


def parse_color_from_csv(path_to_csv: str) -> list[Color]:
    path_to_csv = os.path.abspath(path_to_csv)
    print(path_to_csv)
    result: list[Color] = list()

    with open(path_to_csv) as f:
        for line in f.readlines():
            c_line = line.strip().split(",")  # name,red,green,blue,hex
            if c_line[0] == "name":
                continue

            print(c_line)
            result.append(
                Color(
                    c_line[0], int(c_line[1]), int(c_line[2]), int(c_line[3]), c_line[4]
                )
            )
    return result


def get_list_of_csv(dir: str) -> list[str]:
    dir = os.path.abspath(dir)
    print(dir)
    ls = os.listdir(dir)
    print(ls)
    result: list[str] = list()
    for f in ls:
        f_path = os.path.abspath(os.path.join(dir, f))
        print(f_path)
        if (
            os.path.exists(f_path)
            and os.path.isfile(f_path)
            and os.path.basename(f_path).endswith(".csv")
        ):
            result.append(f_path)
    return result


def create_svg_of_palette(
    palette: list[Color],
) -> str:
    d_palette: dict[int, Color] = dict()
    for c in palette:
        d_palette[c.ansi_code] = c

    def svg_square(
        height: int, width: int, x: int, y: int, color: Color, r: int
    ) -> str:

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
            + color.hex
            + "ff"
            + '" />\n'
        )

    def svg_wrap(palette: dict[int, Color]) -> str:
        svg_height = BORDER_SIZE + CELL_SIZE + BORDER_SIZE + CELL_SIZE + BORDER_SIZE
        svg_width = BORDER_SIZE + 8 * (BORDER_SIZE + CELL_SIZE)
        svg_content = (
            "<style>.small { font: bold "
            + str(TEXT_SIZE)
            + "px mono; fill: "
            + palette[-2].hex
            + ";}</style>"
        )

        svg_content = svg_content + svg_square(
            svg_height, svg_width, 0, 0, palette[-1], 0
        )

        svg_content = (
            svg_content
            + '<text x="'
            + str(BORDER_SIZE)
            + '" y="'
            + str(TEXT_SIZE // 1)
            + '" class="small">FOREGROUND</text>'
        )

        for i in range(0, 16):
            svg_content = svg_content + svg_square(
                CELL_SIZE,
                CELL_SIZE,
                ((BORDER_SIZE + ((i) * BORDER_SIZE)) + ((i) * CELL_SIZE))
                % (svg_width - BORDER_SIZE),
                BORDER_SIZE + (floor((i) / 8) * (BORDER_SIZE + CELL_SIZE)),
                palette[i],
                4,
            )

        return (
            '<svg width="'
            + str(svg_width)
            + '" height="'
            + str(svg_height)
            + '" xmlns="http://www.w3.org/2000/svg">\n'
            + svg_content
            + "</svg>"
        )

    return svg_wrap(d_palette)


def main():
    list_csv = get_list_of_csv(PALETTE_DIR)
    print(list_csv)
    palettes_list: list[tuple[str, list[Color]]] = list()
    for f_csv in list_csv:
        palette_from_csv = parse_color_from_csv(f_csv)
        palettes_list.append((f_csv, palette_from_csv))
    print(palettes_list)
    for p in palettes_list:
        svg_to_write = create_svg_of_palette(p[1])
        with open(p[0].replace(".csv", ".svg"), "w") as file:
            _ = file.write(svg_to_write)


if __name__ == "__main__":
    main()
