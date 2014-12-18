class Board

  def initialize
    @ships = []
  end

  def receive_hit position
    @ships.map(&:position).include?(position) ? :hit : :miss
  end

  def place ship
    @ships << ship
  end

  def ships
    @ships
  end
end