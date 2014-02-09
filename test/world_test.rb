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

end
