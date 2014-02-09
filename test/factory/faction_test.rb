require 'minitest'
require 'minitest/autorun'
require 'mocha/setup'
require 'conquest/factory/faction'

class FactionFactoryTest < Minitest::Test

  def setup
    @names = mock('object')
    @factory = FactionFactory.new @names
  end

  def test_create_factory_with_no_name_generator_fails
    assert_raises RuntimeError do
      @factory = FactionFactory.new nil
    end
  end

  def test_get_first_faction_is_blue
    @names.expects(:generate).returns('Goths')
    faction = @factory.create
    assert_equal 'Goths', faction.name
    assert_equal :blue, faction.color
  end

  def test_2_factions_have_different_colors_blue_then_red
    @names.expects(:generate).twice.returns('Huns').returns('Mongols')
    huns = @factory.create
    mongols = @factory.create

    assert_equal 'Huns', huns.name
    assert_equal :blue, huns.color
    assert_equal 'Mongols', mongols.name
    assert_equal :red, mongols.color
  end

  def test_6_max_factions
    @names.expects(:generate).times(6).returns('Name')
    (0..5).each do
      @factory.create
    end

    assert_raises RuntimeError do
      @factory.create
    end
  end
  # test bulk generation
  # test cant bulk gen 9 factions

end
