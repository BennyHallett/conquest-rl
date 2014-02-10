require 'minitest'
require 'minitest/autorun'
require 'mocha/setup'
require 'conquest/factory/player'

class PlayerFactoryTest < Minitest::Test

  def setup
    @factory = PlayerFactory.new
  end

  def test_new_player_has_position_component
    player = @factory.create
    assert player.has? :position
  end

  def test_new_player_has_movement_component
    player = @factory.create
    assert player.has? :movement
  end

end
