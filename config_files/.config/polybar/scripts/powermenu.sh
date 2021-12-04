#!/bin/bash

#lock_command="lock	betterlockscreen -l blur"
#suspend_command="systemctl suspend"
shutdown_command="shutdown -h now"
reboot_command="reboot"

options=$'shutdown\nreboot'

eval \$"$(echo "$options" | rofi -dmenu -window-title "BYE" -l 4 -theme-str 'window {width: 10%;}')_command"

#
#
#
#
