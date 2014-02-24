require 'delve/widgets/border'

class GameScreen

  def initialize(world, player, screen_manager)
    @world = world
    @manager = screen_manager
    @player = player
    @boundary = nil
    @game_border = nil
  end

  def render(display)
    @boundary ||= BorderWidget.new(0, 0, display.width, display.height)
    @game_border ||= BorderWidget.new(0, 0, display.width - 25, display.height, 'Conquest RL', :white, :black)

    @boundary.draw display
    @game_border.draw display

    (2..display.width-28).each do |x|
      (1..display.height-2).each do |y|
        tile = @world.at(x, y)
        display.draw(x, y, tile[:char], tile[:color], :black)
      end
    end

    x = @player.get(:position).x
    y = @player.get(:position).y
    display.draw x+2, y+1, '@'
  end

  def partial?
    false
  end

  def update(input)
    input = input.wait_for_input

    move = @player.get(:movement)

    move.north if input == 'k'
    move.south if input == 'j'
    move.east if input == 'l'
    move.west if input == 'h'
    move.north_east if input == 'u'
    move.north_west if input == 'y'
    move.south_east if input == 'n'
    move.south_west if input == 'b'

    input == 'x'
  end

end
