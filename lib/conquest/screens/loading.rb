require 'delve/widgets/text'
require 'delve/generator/noise'

require 'conquest/world'

class LoadingScreen

  def initialize(screen_manager)
    @manager = screen_manager
    @text = TextWidget.new :center, :center, 'Creating world (this may take a while)'
    @state = :world
    @world = nil
  end

  def render(display)
    @text.draw display
  end

  def partial?
    false
  end

  def update(input)
    if @state == :world
      @world = World.new(Noise.new(512, 384, :fine))
      @state = :civilisations 
      @text = TextWidget.new :center, :center, 'Founding civilisations'
    elsif @state == :civilisations
      sleep 2
      @state = :population
      @text = TextWidget.new :center, :center, 'Growing the population'
    elsif @state == :population
      sleep 1
      @state = :done
      @text = TextWidget.new :center, :center, 'Done'
    else
      input = input.wait_for_input
      return true
    end
    false
  end

end
