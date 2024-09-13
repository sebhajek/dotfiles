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

* {
\tselected-normal-foreground:  ${BRIGHT_CYAN}FF;
\tforeground:                  ${FOREGROUND}FF;
\tnormal-foreground:           @foreground;
\talternate-normal-background: rgba ( 0, 0, 0, 0 % );
\tred:                         @{REGULAR_RED}FF;
\tselected-urgent-foreground:  @{BRIGHT_RED}FF;
\tblue:                        ${REGULAR_BLUE}FF;
\turgent-foreground:           ${BRIGHT_YELLOW}FF;
\talternate-urgent-background: rgba ( 0, 0, 0, 0 % );
\tactive-foreground:           ${BRIGHT_GREEN}FF;
\tlightbg:                     ${REGULAR_WHITE}FF;
\tselected-active-foreground:  ${BRIGHT_BLACK}FF;
\talternate-active-background: rgba ( 0, 0, 0, 0 % );
\tbackground:                  ${BACKGROUND}88;
\tbordercolor:                 ${BACKGROUND}FF;
\talternate-normal-foreground: @foreground;
\tnormal-background:           ${REGULAR_MAGENTA}08;
\tlightfg:                     ${REGULAR_BLACK}FF;
\tselected-normal-background:  ${BACKGROUND}FF;
\tborder-color:                @bordercolor;
\tspacing:                     1;
\tseparatorcolor:              ${BRIGHT_MAGENTA}FF;
\turgent-background:           ${BRIGHT_BLUE}08;
\tselected-urgent-background:  ${REGULAR_YELLOW}FF;
\talternate-urgent-foreground: @urgent-foreground;
\tbackground-color:            rgba ( 0, 0, 0, 0 % );
\talternate-active-foreground: @active-foreground;
\tactive-background:           ${BACKGROUND}08;
\tselected-active-background:  ${BRIGHT_WHITE}FF;
}
window {
\tbackground-color: @background;
\tborder:           1;
\tpadding:          3;
}
mainbox {
\tborder:  0;
\tpadding: 0;
}
message {
\tborder:       1px 0px 0px ;
\tborder-color: @separatorcolor;
\tpadding:      1px ;
}
textbox {
\ttext-color: @foreground;
}
listview {
\tfixed-height: 0;
\tborder:       2px 0px 0px ;
\tborder-color: @separatorcolor;
\tspacing:      1px ;
\tscrollbar:    true;
\tpadding:      1px 0px 0px ;
}
element {
\tborder:  0;
\tpadding: 1px ;
}
element-text {
\tbackground-color: inherit;
\ttext-color:       inherit;
}
element.normal.normal {
\tbackground-color: @normal-background;
\ttext-color:       @normal-foreground;
}
element.normal.urgent {
\tbackground-color: @urgent-background;
\ttext-color:       @urgent-foreground;
}
element.normal.active {
\tbackground-color: @active-background;
\ttext-color:       @active-foreground;
}
element.selected.normal {
\tbackground-color: @selected-normal-background;
\ttext-color:       @selected-normal-foreground;
}
element.selected.urgent {
\tbackground-color: @selected-urgent-background;
\ttext-color:       @selected-urgent-foreground;
}
element.selected.active {
\tbackground-color: @selected-active-background;
\ttext-color:       @selected-active-foreground;
}
element.alternate.normal {
\tbackground-color: @alternate-normal-background;
\ttext-color:       @alternate-normal-foreground;
}
element.alternate.urgent {
\tbackground-color: @alternate-urgent-background;
\ttext-color:       @alternate-urgent-foreground;
}
element.alternate.active {
\tbackground-color: @alternate-active-background;
\ttext-color:       @alternate-active-foreground;
}
scrollbar {
\twidth:        2px ;
\tborder:       0;
\thandle-width: 4px ;
\tpadding:      0;
}
mode-switcher {
\tborder:       1px 0px 0px ;
\tborder-color: @separatorcolor;
}
button.selected {
\tbackground-color: @selected-normal-background;
\ttext-color:       @selected-normal-foreground;
}
inputbar {
\tspacing:    0;
\ttext-color: @normal-foreground;
\tpadding:    1px ;
}
case-indicator {
\tspacing:    0;
\ttext-color: @normal-foreground;
}
entry {
\tspacing:    0;
\ttext-color: @normal-foreground;
}
prompt, button{
\tspacing:    0;
\ttext-color: @normal-foreground;
}
inputbar {
\tchildren:   [ prompt,textbox-prompt-colon,entry,case-indicator ];
}
textbox-prompt-colon {
\texpand:     false;
\tstr:        ":";
\tmargin:     0px 0.3em 0em 0em ;
\ttext-color: @normal-foreground;
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
