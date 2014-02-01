#!/usr/bin/env ruby

require 'optparse'
require 'delve/display/curses_renderer'
require 'delve/display/display'
require 'delve/screen_manager'
require 'delve/widgets/text'

options = {}
option_parser = OptionParser.new do |opts|
end

display = Display.new CursesRenderer.new
title = TextWidget.new 1, 1, 'Conquest RL'
subtitle = TextWidget.new 1, 2, 'Build yourself, build your army, conquer the world'
start_command = TextWidget.new 20, 20, 'Press the "n" key to begin'
exit_command = TextWidget.new 20, 21, 'Press the "x" key to exit'

title.draw display
subtitle.draw display
start_command.draw display
exit_command.draw display

display.render

sleep 3

display.exit
