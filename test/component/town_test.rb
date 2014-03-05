require 'minitest'
require 'minitest/autorun'
require 'conquest/component/town'
require 'mocha/setup'

class TownComponentTest < Minitest::Test

  def setup
    @parent = mock('object')
    @name = 'Eldar'
    @town = TownComponent.new @parent, @name
  end

  def test_initialize_component_with_nil_parent_fails
    assert_raises RuntimeError do
      TownComponent.new nil, @name
    end
  end

  def test_initialize_component_with_nil_world_fails
    assert_raises RuntimeError do
      TownComponent.new @parent, nil
    end
  end

  def test_id
    assert_equal :town, @town.id
  end

  def test_get_name
    assert_equal @name, @town.name
  end

end
