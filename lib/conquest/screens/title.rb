require 'delve/widgets/text'

class TitleScreen

  def initialize
    @title = TextWidget.new 1, 1, 'Conquest RL'
    @subtitle = TextWidget.new 1, 2, 'Build yourself, build your army, conquer the world'
  end

  def render(display)
    @title.draw display
    @subtitle.draw display
  end

  def partial?
    false
  end

end
