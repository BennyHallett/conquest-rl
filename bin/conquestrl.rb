#!/usr/bin/env ruby

require 'optparse'
require 'delve/display/curses_renderer'
require 'delve/display/display'
require 'delve/screen_manager'
require 'conquest/screens/title'

options = {}
option_parser = OptionParser.new do |opts|
end

display = Display.new CursesRenderer.new
title_screen = TitleScreen.new

title_screen.draw
display.render

sleep 3

display.exit
