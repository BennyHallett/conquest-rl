require 'minitest'
require 'minitest/autorun'
require 'mocha/setup'
require 'conquest/faction'

class FactionTest < Minitest::Test

  def setup
    @name = 'Nargoth'
    @color = :green
    @faction = Faction.new @name, @color
  end

  def test_create_faction_without_name_fails
    assert_raises RuntimeError do
      @faction = Faction.new nil, @color
    end
  end

  def test_create_faction_without_color_fails
    assert_raises RuntimeError do
      @faction = Faction.new @name, nil
    end
  end

  def test_get_name
    assert_equal @name, @faction.name
  end

  def test_get_color
    assert_equal @color, @faction.color
  end

  # also add race at some point

end
