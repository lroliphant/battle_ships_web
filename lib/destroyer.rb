require_relative 'submarine'

class Destroyer < Submarine
  def size
  	3
  end

  def position
    case direction
    when :N
      [start_position,go_north(start_position),go_north(go_north(start_position))]
    when :E
      [start_position,go_east(start_position),go_east(go_east(start_position))]
    when :S
      [start_position,go_south(start_position),go_south(go_south(start_position))]
    when :W
      [start_position,go_west(start_position),go_west(go_west(start_position))]
    end
  end
end