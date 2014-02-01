require 'minitest'
require 'minitest/autorun'
require 'mocha/setup'
require 'conquest/screens/title'
require 'delve/widgets/text'

class TitleScreenTest < Minitest::Test

  def test_initialize_creates_widgets
    TextWidget.expects(:new).with(1, 1, 'Conquest RL')
    TextWidget.expects(:new).with(1, 2, 'Build yourself, build your army, conquer the world')
    TextWidget.expects(:new).with(20, 20, 'Press the "n" key to begin')
    TextWidget.expects(:new).with(20, 21, 'Press the "x" key to exit')

    TitleScreen.new
  end

end