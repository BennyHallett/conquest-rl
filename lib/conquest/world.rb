class World

  def initialize(generator)
    raise 'Cannot create world when generator is nil' unless generator

    @world = Hash.new
    generator.generate do |x, y, height|
      @world[key_for(x.floor, y.floor)] = tile_for_height(height)
    end
  end

  def at(x, y)
    @world[key_for(x, y)]
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

    { char: t, color: c, walkable: v < 7 and v >= 3 }
  end

end
