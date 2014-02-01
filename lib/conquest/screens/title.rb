require 'delve/widgets/text'

class TitleScreen

  def initialize
    @title = TextWidget.new 1, 1, 'Conquest RL'
    @subtitle = TextWidget.new 1, 2, 'Build yourself, build your army, conquer the world'
    @start_command = TextWidget.new 20, 20, 'Press the "n" key to begin'
    @exit_command = TextWidget.new 20, 21, 'Press the "x" key to exit'
  end

end
