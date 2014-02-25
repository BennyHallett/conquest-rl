require 'minitest'
require 'minitest/autorun'
require 'mocha/setup'
require 'conquest/world'

class WorldTest < Minitest::Test

  def setup
    @generator = mock('object')
    @generator.stubs(:generate)
    @world = World.new @generator
  end

  def test_cannot_create_world_without_generator
    assert_raises RuntimeError do
      @world = World.new nil
    end
  end

  def test_create_world
    @generator.expects(:generate)
    @world = World.new @generator
  end

  def test_get_position
    assert @world.at(1, 1) != 0
  end

  def test_add_entity_places_it_at_1_1
    entity = mock('object')
    position = mock('object')
    position.expects(:x).returns(1)
    position.expects(:y).returns(1)
    symbol = mock('object')
    symbol.expects(:symbol).returns('@')
    entity.expects(:has?).with(:position).returns(true)
    entity.expects(:has?).with(:symbol).returns(true)
    entity.expects(:get).with(:position).returns(position)
    entity.expects(:get).with(:symbol).returns(symbol)

    @world.add_entity entity
    assert_equal '@', @world.at(1, 1)
  end

  def test_add_entity_with_no_position_fails
    entity = mock('object')
    entity.expects(:has?).with(:position).returns(false)

    assert_raises RuntimeError do
      @world.add_entity entity
    end
  end

end
