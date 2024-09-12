import string

template: string.Template = string.Template(
    """
# class\t\t\tborder\tbackgr.\ttext\tindic.\tchild
client.focused\t\t${BACKGROUND}\t${BACKGROUND}\t${BRIGHT_CYAN}\t${REGULAR_CYAN}\t${BACKGROUND}
client.focused_inactive\t${BACKGROUND}\t${BACKGROUND}\t${REGULAR_WHITE}\t${BRIGHT_WHITE}\t${BACKGROUND}
client.unfocused\t${BACKGROUND}\t${BACKGROUND}\t${BRIGHT_MAGENTA}\t${REGULAR_MAGENTA}\t${BACKGROUND}
client.urgent\t\t${REGULAR_RED}\t${REGULAR_RED}\t${BRIGHT_BLACK}\t${REGULAR_YELLOW}\t${REGULAR_RED}
client.placeholder\t${REGULAR_GREEN}\t${REGULAR_GREEN}\t${BRIGHT_MAGENTA}\t${BRIGHT_GREEN}\t${REGULAR_GREEN}

client.background\t\t${BACKGROUND}
"""
)

bar_template: string.Template = string.Template(
    """
bar {
\tstatus_command i3status
\tfont pango:Cozette, JuliaMono, mono Regular 9
\tworkspace_buttons yes
\tbinding_mode_indicator yes
\t#padding 1px 1px 2px 1px

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

status_template: string.Template = string.Template(
    """
general {
\tcolors = true
\tinterval = 16

\tcolor_good = \"${BRIGHT_CYAN}\"
\tcolor_degraded = \"${BRIGHT_WHITE}\"
\tcolor_bad = \"${BRIGHT_RED}\"
}

order += "load"
order += "wireless _first_"
#order += "disk /"
#order += "memory"
order += "battery all"
order += "tztime local"

wireless _first_ {
\tformat_up = "W: %quality @ %ip"
\tformat_down = "W: 0% @ none"
}

battery all {
\tinteger_battery_capacity = true
\tstatus_chr = "CHR"
\tstatus_bat = "BAT"
\tstatus_unk = "UNK"
\tstatus_full = "FUL"
\tlow_threshold = 32
\tformat = "%status %percentage"
}

disk "/" {
\tformat = "%avail"
}

load {
\tformat = "CPU: %1min"
}

memory {
\tformat = "%used | %available"
\tthreshold_degraded = "1G"
\tformat_degraded = "MEMORY < %available"
}

tztime local {
\tformat = "%H:%M :: %Y-%m-%d"
}
"""
)

rofi_template = string.Template(
    """
configuration{
\tmodes:[combi];
\tcombi-modes:[drun,run];
}

@theme "lb"

configuration{
\tfont:"Cozette 9";

\tdrun{
\t\tdisplay-name: ":drun";
\t}

\trun{
\t\tdisplay-name: ":run";
\t}

\ttimeout{
\t\tdelay: 10;
\t\taction: "kb-cancel";
\t}
}

*{
\tborder:0;
\tmargin:0;
\tpadding:2px;
\tspacing:0;

\tbg:${BACKGROUND};
\tbg-alt:${REGULAR_BLACK};
\tfg:${FOREGROUND};
\tfg-alt:${BRIGHT_CYAN};

\tbackground-color:@bg;
\ttext-color:@fg;
}

window {
\ttransparency:"real";
}

mainbox {
\tchildren:[inputbar,listview];
}

inputbar{
\tchildren:[prompt,entry];
}

entry{
\tpadding:4px 0;
}

prompt{
\tpadding:4px;
}

listview{
\tlines:8;
}

element{
\tchildren:[element-text];
}

element-text{
\tpadding:2px;
\ttext-color:@fg;
}

element-text selected{
\ttext-color:@fg-alt;
}
"""
)

colors: dict[str, str] = dict()

with open("./palettes/oxoargon.csv", "r") as palette_csv:
    for line in palette_csv.readlines()[1:]:
        values = line.strip().split(",")
        colors[values[0]] = values[4]

with open("./wm/colors", "w") as wm_colors:
    _ = wm_colors.write(template.safe_substitute(colors))

with open("./wm/bar", "w") as wm_bar:
    _ = wm_bar.write(bar_template.safe_substitute(colors))

with open("./i3status/config", "w") as wm_status:
    _ = wm_status.write(status_template.safe_substitute(colors))

with open("./rofi/config.rasi", "w") as rofi_config:
    _ = rofi_config.write(rofi_template.safe_substitute(colors))
