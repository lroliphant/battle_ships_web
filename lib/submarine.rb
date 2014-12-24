class Submarine < Ship
  def initialize position, direction
    super position, direction, 2
  end

  def position
    case direction
    when :N
      [start_position,go_north(start_position)]
    when :E
      [start_position,go_east(start_position)]
    when :S
      [start_position,go_south(start_position)]
    when :W
      [start_position,go_west(start_position)]
    end
  end

  def hit position
    return :miss unless self.position.include? position 
    @hits+=1
    :hit
  end

  private

  def go_west position
    (position[0].ord - 1).chr + position[1]
  end

  def go_east position
    (position[0].ord + 1).chr + position[1]
  end

  def go_south position
    position[0] + (position[1].to_i + 1).to_s
  end

  def go_north position
    position[0] + (position[1].to_i - 1).to_s
  end

end