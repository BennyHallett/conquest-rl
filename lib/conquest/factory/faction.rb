class FactionFactory

  def initialize(name_generator)
    raise 'Cannot create faction factory if name generator is nil' unless name_generator    

    @name = name_generator
    @colors = [:blue, :red, :green, :yellow, :white, :cyan]
  end

  def create
    Faction.new @name.generate, @colors.shift
  end

end
