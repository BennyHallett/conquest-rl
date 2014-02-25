class World

  def initialize(generator)
    raise 'Cannot create world when generator is nil' unless generator

    @world = Hash.new
    @entities = Hash.new
    @width = generator.width
    @height = generator.height
    generator.generate do |x, y, height|
      @world[key_for(x.floor, y.floor)] = tile_for_height(height)
    end
  end

  def at(x, y)
    key = key_for(x, y)
    entity = @entities[key]
    return entity.get(:symbol).symbol if entity and entity.has?(:symbol)
    @world[key_for(x, y)]
  end

  def entities
    @entities
  end

  def add_entity(entity)
    raise 'Cannot add entity that doesnt have a position' unless entity.has? :position
    pos = entity.get :position
    @entities[key_for(pos.x, pos.y)] = entity
  end

  def width
    @width
  end

  def height
    @height
  end

  def free(x, y)
    at(x, y)[:walkable]
  end

  private
  def key_for(x, y)
    "#{x},#{y}"
  end

  def tile_for_height(height)
    v = (height * 10).floor
    t = '.'
    t = '^' if v < 9
    t = 'm' if v < 7
    t = '.' if v < 5
    t = '~' if v < 3
    
    c = :white
    c = :green if v < 7
    c = :cyan if v < 3
    c = :blue if v < 1

    { char: t, color: c, walkable: (v < 7 and v >= 3) }
  end

end
