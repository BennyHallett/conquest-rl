require 'minitest'
require 'minitest/autorun'
require 'mocha/setup'
require 'conquest/factory/player'

class PlayerFactoryTest < Minitest::Test

  def setup
    @world = mock('object')
    @factory = PlayerFactory.new
    @player = @factory.create @world
  end

  def test_new_player_has_position_component
    assert @player.has? :position
  end

  def test_new_player_has_movement_component
    assert @player.has? :movement
  end

  def test_new_player_has_symbol_component
    assert @player.has? :symbol
  end

  def test_new_player_has_collision_component
    assert @player.has? :collision
  end

end
