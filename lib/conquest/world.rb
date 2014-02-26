class World

  def initialize(generator)
    raise 'Cannot create world when generator is nil' unless generator

    @world = Hash.new
    @entities = Array.new
    @width = generator.width
    @height = generator.height
    generator.generate do |x, y, height|
      @world[key_for(x.floor, y.floor)] = tile_for_height(height)
    end
  end

  def at(x, y)
    key = key_for(x, y)
    # This is super inefficient
    found = @entities.select { |e| e.get(:position).x == x and e.get(:position).y == y }
    entity = found.first
    if entity and entity.has?(:symbol)
      return entity.get(:symbol).symbol
    else
      return @world[key_for(x, y)]
    end
  end

  def entities
    @entities
  end

  def add_entity(entity)
    raise 'Cannot add entity that doesnt have a position' unless entity.has? :position
    @entities << entity
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
