require 'board'

describe Board do

  let(:board){Board.new}
  let(:ship){double :ship, position: 'A1'}

  it 'can receive a hit on water' do
    expect(board.receive_hit('A1')).to eq :miss
  end

  it 'can have a ship' do
    board.place(ship)
    expect(board.ships.first.position).to eq 'A1'
  end

  it 'can receive a hit on a ship' do
    board.place(ship)
    expect(board.receive_hit('A1')).to eq :hit
  end
end