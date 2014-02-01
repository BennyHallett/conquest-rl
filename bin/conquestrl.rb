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
screen_manager = ScreenManager.new
screen_manager.push_screen title_screen

screen_manager.render display
display.render

sleep 3

display.exit
