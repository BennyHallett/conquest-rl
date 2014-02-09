class World

  def initialize(generator)
    raise 'Cannot create world when generator is nil' unless generator

    @world = Hash.new
    generator.generate do |x, y, height|
      @world[key_for(x, y)] = height
    end
  end

  def at(x, y)
    @world[key_for(x, y)]
  end

  private
  def key_for(x, y)
    "#{x},#{y}"
  end

end
