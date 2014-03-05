class TownComponent
  def initialize(parent, name)
    raise 'Cannot create town component when parent is nil' unless parent
    raise 'Cannot create town component when name is nil' unless name

    @parent = parent
    @name = name
  end

  def id
    :town
  end

  def name
    @name
  end

end
