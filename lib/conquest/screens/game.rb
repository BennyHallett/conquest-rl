require 'delve/widgets/border'

class GameScreen

  def initialize(world, screen_manager)
    @world = world
    @manager = screen_manager
    @boundary = nil
    @game_border = nil
  end

  def render(display)
    @boundary ||= BorderWidget.new(0, 0, display.width, display.height)
    @game_border ||= BorderWidget.new(0, 0, display.width - 25, display.height, 'Conquest RL', :white, :black, false)

    @boundary.draw display
    @game_border.draw display

    (2..display.width-28).each do |x|
      (1..display.height-2).each do |y|
        tile = @world.at(x, y)
        display.draw(x, y, tile[:char], tile[:color], :black)
      end
    end
  end

  def partial?
    false
  end

  def update(input)
    input = input.wait_for_input
    input == 'x'
  end

end
