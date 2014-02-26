require 'delve/widgets/text'
require 'delve/generator/noise'

require 'conquest/world'
require 'conquest/factory/faction'
require 'conquest/factory/player'
require 'conquest/generator/names'
require 'conquest/screens/game'

class LoadingScreen

  def initialize(screen_manager)
    @manager = screen_manager
    @text = TextWidget.new :center, :center, 'Creating world (this may take a while)'
    @faction_factory = FactionFactory.new NameGenerator.new
    @state = :world
    @world = nil
    @player = nil
  end

  def render(display)
    @text.draw display
  end

  def partial?
    false
  end

  def update(input)
    if @state == :world
      @world = World.new(Noise.new(256, 128, :fine))
      @state = :civilisations 
      @text = TextWidget.new :center, :center, 'Founding civilisations'
    elsif @state == :civilisations
      sleep 2
      @state = :population
      @text = TextWidget.new :center, :center, 'Growing the population'
    elsif @state == :population
      sleep 1
      @state = :hero
      @text = TextWidget.new :center, :center, 'Locating hero'
    elsif @state == :hero
      @player = PlayerFactory.new.create @world
      randomize_player_location
      @state = :done
      @text = TextWidget.new :center, :center, 'Done. Press any key to continue'
    else
      input = input.wait_for_input
      @manager.push_screen GameScreen.new(@world, @player, @manager)
    end
    false
  end

  private
  def randomize_player_location
    rx = (rand * @world.width).floor
    ry = (rand * @world.height).floor

    while !@world.free(rx, ry)
      rx = (rand * @world.width).floor
      ry = (rand * @world.height).floor
    end

    @player.get(:position).set(rx, ry)
  end

end
