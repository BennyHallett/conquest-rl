require 'delve/widgets/text'

class LoadingScreen

  def initialize(screen_manager)
    @manager = screen_manager
    @text = TextWidget.new :center, :center, 'Creating world...'
    @state = :world
  end

  def render(display)
    @text.draw display
  end

  def partial?
    false
  end

  def update(input)
    if @state == :world
      # Create world
      sleep 3
      @state = :civilisations 
      @text = TextWidget.new :center, :center, 'Founding civilisations...'
    elsif @state == :civilisations
      sleep 2
      @state = :population
      @text = TextWidget.new :center, :center, 'Growing the population...'
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
