require 'delve/widgets/menu'
require 'delve/widgets/multi_line'

require 'conquest/screens/loading'

class TitleScreen

  def initialize(screen_manager)
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
    
    @menu = MenuWidget.new 1, 15, {
      'n' => 'New game',
      'x' => 'Exit'
    }
    @manager = screen_manager
  end

  def render(display)
    @title.draw display
    @menu.draw display
  end

  def partial?
    false
  end

  def update(input)
    input = input.wait_for_input
    
    @menu.next if input == :down_arrow
    @menu.prev if input == :up_arrow
    
    @menu.select(input)
    
    if @menu.selected_item == 'New game'
      @manager.push_screen LoadingScreen.new(@manager)
    end

    @menu.selected_item == 'Exit'
  end

end
