class CollisionComponent
  def initialize(parent, world)
    raise 'Cannot create collision component when parent is nil' unless parent
    raise 'Cannot create collision component when world is nil' unless world

    @parent = parent
    @world = world
  end

  def id
    :collision
  end

  def free(x, y)
    @world.free(x, y)
  end
end
