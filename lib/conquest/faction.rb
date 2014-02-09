class Faction

  def initialize(name, color)
    raise 'Cannot create faction with no name' unless name
    raise 'Cannot create faction with no color' unless color

    @name = name
    @color = color
  end

  def name
    @name
  end

  def color
    @color
  end

end
