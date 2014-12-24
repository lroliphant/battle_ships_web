require 'byebug'
class Ship
  attr_reader :position, :hits, :size

  def initialize position, direction, size = 1
    @direction = direction
    @position = position
    @start_position = position
    @size = size
    @hits = 0
  end

  def hit position
    return :miss if self.position != position 
    @hits+=1
    :hit
  end

  def sunk?
    @hits >= @size
  end

  private 

  attr_reader :direction, :start_position

end

class RowingBoat < Ship
end









