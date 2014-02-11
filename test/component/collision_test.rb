require 'minitest'
require 'minitest/autorun'
require 'conquest/component/collision'
require 'mocha/setup'

class CollisionComponentTest < Minitest::Test

  def setup
    @parent = mock('object')
    @pos = CollisionComponent.new @parent
  end

  def test_initialize_component_with_nil_parent_fails
    assert_raises RuntimeError do
      PositionComponent.new nil
    end
  end

  def test_id
    assert_equal :collision, @pos.id
  end
end
