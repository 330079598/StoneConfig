;==========================================================
;
;
;   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
;   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
;   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
;   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
;   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
;   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
;
;
;==========================================================

[colors]
background = #11121D
foreground = #A0A8CD
content-background = #2b2f37
blue = #7199EE
cyan = #38A89D
green =  #A0E8A2
orange = #d19a66
red =  #e06c75
yellow = #D4B261
purple = #d3869b
light-gray = #565c64
black = #1d2021
aqua = #8ec07c

[bar/bar]
tray-position = right
tray-padding = 5
tray-backgroud = ${colors.background}
width =  100%
height = 18
padding-left = 0
padding-right = 0
background = ${colors.background}
foreground = ${colors.foreground}
bottom = false
border-top-size = 5
border-bottom-size = 5
border-top-color = ${colors.background}
border-bottom-color = ${colors.background}
line-size = 2
wm-restack = i3
modules-left = round-left i3 round-right
modules-center = round-left time round-right
modules-right =  battery backlight alsa temperature cpu mem  wlan powermenu
font-0 = Hack Nerd Font:style=Bold:pixelsize=12;3
font-1 = JetBrainsMono Nerd Font:size=12;3
font-2 = Material Design Icons:style=Bold:size=12;3
font-3 = unifont:fontformat=truetype:size=12:antialias=true;
font-4 = siji:pixelsize=8;1
font-5 = Font Awesome 5 Free:pixelsize=12;2
font-6 = Font Awesome 5 Free Solid:pixelsize=12;2
font-7 = Font Awesome 5 Brands:pixelsize=12;2

[module/round-left]
type = custom/text
content = %{T3}%{T-}
content-foreground = ${colors.content-background}

[module/round-right]
type = custom/text
content = %{T3}%{T-}
content-foreground = ${colors.content-background}

[module/temperature]
type = internal/temperature
ramp-0 = "󰜗"
thermal-zone = 0
warn-temperature = 70
format = <ramp><label>
format-warn = <ramp><label-warn>
label = %temperature-c%
label-warn = %temperature-c%
ramp-foreground = ${colors.blue}
format-padding = 3

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false

; Only show workspaces on the same output as the bar
;pin-workspaces = true

ws-icon-0 = 1;1.
ws-icon-1 = 2;2.
ws-icon-2 = 3;3.
ws-icon-3 = 4;4.
ws-icon-4 = 5;5.
ws-icon-5 = 6;6.

label-mode-padding = 2
label-mode-foreground = ${colors.light-gray}
label-mode-background = ${colors.light-gray}

; focused = Active workspace on focused monitor
label-focused = %icon%
label-focused-background = ${colors.yellow}
label-focused-underline= ${colors.purple}
label-focused-padding = 2

; unfocused = Inactive workspace on any monitor
label-unfocused = %icon%
label-unfocused-padding = 2

; visible = Active workspace on unfocused monitor
label-visible = %icon%
label-visible-background = ${self.label-focused-background}
label-visible-underline = ${self.label-focused-underline}
label-visible-padding = ${self.label-focused-padding}

; urgent = Workspace with urgency hint set
label-urgent = %icon%
label-urgent-background = ${colors.alert}
label-urgent-padding = 2

; Separator in between workspaces
; label-separator = |

[module/alsa]
type = internal/alsa
format-volume = <ramp-volume> <label-volume>
format-muted = <label-muted>
label-volume = %percentage%%
label-muted = " "
label-volume-foreground = ${colors.foreground}
format-muted-foreground = ${colors.foreground}
format-muted-padding = 3
format-muted-background = ${colors.content-background}
ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 
ramp-volume-foreground = ${colors.cyan}
ramp-headphones-0 = 
ramp-headphones-foreground = ${colors.cyan}
format-padding = 3

[module/pulseaudio]
type = internal/pulseaudio
format-volume = <ramp-volume> <label-volume>
format-muted = <label-muted>
label-volume = %percentage%%
label-muted = " "
label-volume-foreground = ${colors.foreground}
format-muted-foreground = ${colors.foreground}
format-muted-padding = 3
format-muted-background = ${colors.content-background}
ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 
ramp-volume-foreground = ${colors.cyan}
ramp-headphones-0 = 
ramp-headphones-foreground = ${colors.cyan}
format-padding = 3

[module/time]
type = internal/date
interval = 60
format = <label>
format-background = ${colors.content-background}
date = %{F#888e96}󰥔 %H:%M%{F-}
time-alt = %{F#7199EE}󰃭 %a, %b %d%{F-}
label = %date%%time%
format-padding = 1

[module/mem]
type = custom/script
exec = printf "%.1f\n" $(echo $(free -m | sed -n 's/^Mem:\s\+[0-9]\+\s\+\([0-9]\+\)\s.\+/\1/p')/1024 | bc -l)
format = <label>
format-prefix = "  "
label = "%output%GB"
format-prefix-foreground = ${colors.orange}
format-padding = 3

[module/cpu]
type = internal/cpu
interval = 2.5
format = <label>
format-prefix = " "
label = "%percentage:02%%"
format-prefix-foreground = ${colors.purple}
format-padding = 0

[module/powermenu]
type = custom/text
content =""
content-padding = 1
click-left = bspc quit &
content-foreground =  ${colors.red}

[module/wlan]
type = internal/network
interface = wlp5s0
interval = 10.0
format-connected = <label-connected>
label-connected = "󰤪 "
label-connected-foreground = ${colors.green}
format-padding = 1

[module/battery]
type = internal/battery
battery = BAT0
adapter = ADP1
full-at = 100
poll-interval = 6
format-charging = <ramp-capacity> <label-charging>
label-charging = %percentage:2%%
format-charging-padding = 3
format-charging-foreground = ${colors.foreground}
format-discharging = <ramp-capacity> <label-discharging>
label-discharging = %percentage%%
format-discharging-foreground = ${colors.foreground}
format-full-prefix = "  "
format-full-prefix-foreground = ${colors.green}
format-foreground = ${colors.foreground}
format-background = ${colors.content-background}
label-discharging-foreground = ${colors.foreground}
ramp-capacity-foreground =  ${colors.green}
label-charging-foreground = ${colors.foreground}
ramp-capacity-0 = "  "
ramp-capacity-1 = "  "
ramp-capacity-2 = "  "
ramp-capacity-3 = "  "
ramp-capacity-4 = "  "
animation-charging-0 = "  "
animation-charging-1 = "  "
animation-charging-2 = "  "
animation-charging-3 = "  "
animation-charging-4 = "  "
animation-charging-foreground = ${colors.red}
animation-charging-framerate = 910
format-discharging-padding = 3

[module/backlight]
type = internal/backlight
card = intel_backlight
format = <label>
format-prefix = " "
label = %percentage:2%%
format-prefix-foreground = ${colors.yellow}
