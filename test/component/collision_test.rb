require 'minitest'
require 'minitest/autorun'
require 'conquest/component/collision'
require 'mocha/setup'

class CollisionComponentTest < Minitest::Test

  def setup
    @parent = mock('object')
    @world = mock('object')
    @pos = CollisionComponent.new @parent, @world
  end

  def test_initialize_component_with_nil_parent_fails
    assert_raises RuntimeError do
      CollisionComponent.new nil, @world
    end
  end

  def test_initialize_component_with_nil_world_fails
    assert_raises RuntimeError do
      CollisionComponent.new @parent, nil
    end
  end

  def test_id
    assert_equal :collision, @pos.id
  end
end
