require_relative 'ship'

class Submarine < Ship
  def initialize position, direction
    super position, direction, size
  end

  def size
    2
  end
end
