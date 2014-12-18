class Cell
  attr_reader :contents
  def initialize
    @contents = :water
  end
  def place contents
    @contents = contents
  end
  def receive_hit
    @contents == :water ? :miss : :hit
  end
end