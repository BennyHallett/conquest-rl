class CollisionComponent
  def initialize(parent)
    raise 'Cannot create position comonent when parent is nil' unless parent
    @parent = parent
  end

  def id
    :collision
  end
end
