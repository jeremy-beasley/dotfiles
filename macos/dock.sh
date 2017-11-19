#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Trello.app"
dockutil --no-restart --add "/Applications/Utilities/iTerm.app"
dockutil --no-restart --add "/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Day One.app"
dockutil --no-restart --add "/Applications/Mail.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/iTunes.app"

killall Dock
