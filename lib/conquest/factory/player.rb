require 'delve/entity'
require 'delve/component/position'
require 'delve/component/movement'
require 'delve/component/symbol'

class PlayerFactory

  def create
    player = Entity.new
    player.add PositionComponent.new(player)
    player.add MovementComponent.new(player, :eightway)
    player.add SymbolComponent.new(player, '@')
    player
  end

end
