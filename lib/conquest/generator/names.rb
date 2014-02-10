class NameGenerator

  def initialize
    @names = ['Huns', 'Goths', 'Franks', 'Romans', 'Greeks', 'Mongols', 'Terrans']
  end

  def generate
    @names.shift
  end

end
