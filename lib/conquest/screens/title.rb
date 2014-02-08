require 'delve/widgets/text'
require 'delve/widgets/multi_line'

class TitleScreen

  def initialize
    @title = MultiLineWidget.new :center, 1, [
' .d8888b.                                                        888    ',
'd88P  Y88b                                                       888    ',
'888    888                                                       888    ',
'888         .d88b.  88888b.   .d88888 888  888  .d88b.  .d8888b  888888 ',
'888        d88""88b 888 "88b d88" 888 888  888 d8P  Y8b 88K      888    ',
'888    888 888  888 888  888 888  888 888  888 88888888 "Y8888b. 888    ',
'Y88b  d88P Y88..88P 888  888 Y88b 888 Y88b 888 Y8b.          X88 Y88b.  ',
' "Y8888P"   "Y88P"  888  888  "Y88888  "Y88888  "Y8888   88888P\'  "Y888 ',
'                                  888                                   ',
'                                  888         R O G U E L I K E         ',
'                                  888         =================         '
    ]
  
    @subtitle = TextWidget.new :center, 15, 'Build yourself, build your army, conquer the world'
    @start = TextWidget.new :center, 17, 'Press any key to begin'
  end

  def render(display)
    @title.draw display
    @subtitle.draw display
    @start.draw display

    display.render
  end

  def partial?
    false
  end

  def update(input)
    input.wait_for_input
    true
  end

end
