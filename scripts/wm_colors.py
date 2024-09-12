import string

template: string.Template = string.Template(
    """
# class\t\t\tborder\tbackgr.\ttext\tindic.\tchild
client.focused\t\t${REGULAR_MAGENTA}\t${REGULAR_BLACK}\t${BRIGHT_CYAN}\t${REGULAR_CYAN}\t${REGULAR_BLUE}
client.focused_inactive\t${REGULAR_BLACK}\t${REGULAR_BLACK}\t${REGULAR_WHITE}\t${BRIGHT_WHITE}\t${BRIGHT_BLACK}
client.unfocused\t${BACKGROUND}\t${BACKGROUND}\t${BRIGHT_MAGENTA}\t${REGULAR_MAGENTA}\t${BRIGHT_BLACK}
client.urgent\t\t${REGULAR_RED}\t${REGULAR_RED}\t${BRIGHT_BLACK}\t${REGULAR_YELLOW}\t${BRIGHT_RED}
client.placeholder\t${REGULAR_GREEN}\t${REGULAR_GREEN}\t${BRIGHT_MAGENTA}\t${BRIGHT_GREEN}\t${REGULAR_WHITE}

client.background\t\t${BACKGROUND}
"""
)

bar_template: string.Template = string.Template(
    """
bar {
\tcolors {
\t\tbackground\t${BACKGROUND}
\t\tstatusline\t${BRIGHT_MAGENTA}
\t\tseparator\t${REGULAR_WHITE}

\t\tfocused_workspace\t${BRIGHT_CYAN}\t${REGULAR_BLACK}\t${BRIGHT_CYAN}
\t\tactive_workspace\t${REGULAR_BLUE}\t${REGULAR_BLACK}\t${REGULAR_BLUE}
\t\tinactive_workspace\t${REGULAR_MAGENTA}\t${REGULAR_BLACK}\t${BRIGHT_MAGENTA}
\t\turgent_workspace\t${REGULAR_RED}\t${REGULAR_BLACK}\t${REGULAR_YELLOW}
\t\tbinding_mode\t\t${REGULAR_GREEN}\t${REGULAR_BLACK}\t${REGULAR_WHITE}
\t}
}
"""
)

colors: dict[str, str] = dict()

with open("./palettes/oxoargon.csv", "r") as palette_csv:
    for line in palette_csv.readlines()[1:]:
        values = line.strip().split(",")
        colors[values[0]] = values[4]

with open("./wm/colors", "w") as wm_colors:
    con = template.safe_substitute(colors) + "\n" + bar_template.safe_substitute(colors)
    print(con)
    _ = wm_colors.write(con)
