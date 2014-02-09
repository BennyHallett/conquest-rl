class FactionFactory

  def initialize(name_generator)
    raise 'Cannot create faction factory if name generator is nil' unless name_generator    

    @name = name_generator
    @colors = [:blue, :red, :green, :yellow, :white, :cyan]
  end

  def create(count = 1)
    raise 'Cannot create any more factions. Limit reached' if @colors.empty? or count > @colors.length
    return Faction.new @name.generate, @colors.shift if count == 1

    factions = Array.new
    (0..count-1).each do
      factions << Faction.new(@name.generate, @colors.shift)
    end
    factions
  end

end
