require 'minitest'
require 'minitest/autorun'
require 'mocha/setup'
require 'conquest/screens/title'
require 'delve/widgets/multi_line'
require 'delve/widgets/menu'

class TitleScreenTest < Minitest::Test

  def setup
    @screen_manager = mock('object')
    @title = TitleScreen.new(@screen_manager)
    @display = mock('object')
  end

  def test_initialize_creates_widgets
    MultiLineWidget.expects(:new)
    MenuWidget.expects(:new)

    TitleScreen.new @screen_manager
  end

  def test_drawing_screen
    @display.expects(:width).times(11).returns(100)
    @display.expects(:draw).times(804)
    @title.render @display
  end

  def test_title_screen_isnt_partial
    assert !@title.partial?
  end

end
