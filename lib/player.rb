require_relative 'board'
require_relative 'ship'

class Player
  attr_reader :board, :hits, :misses

  def self.player_index
    @players ||= {}
  end

  def initialize
    Player.player_index[self.object_id] = self
    @board = Board.new
    @hits = []
    @misses = []
  end

  def lost?
    board.all_sunk?
  end

  def place klass, position, direction
    board.place klass.new(position, direction)
  end

  def receive_hit position
    result = board.receive_hit(position)
    array = result == :hit ? @hits : @misses
    array << position
    result
  end

  def self.get_player id
    @players[id]
  end
end
