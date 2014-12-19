require 'board'

describe Board do

  let(:board){Board.new}
  let(:sunk_ship){double :ship, position: 'A1', sunk?: true, hit: :hit}
  let(:ship){double :ship, position: 'A1', sunk?: false, hit: :hit}

  it 'can receive a hit on water' do
    expect(board.receive_hit('A1')).to eq :miss
  end

  it 'can have a ship' do
    board.place(ship)
    expect(board.ships.first.position).to eq 'A1'
  end

  xit 'does not allow ships to overlap' do

  end

  it 'can receive a hit on a ship' do
    board.place(ship)
    expect(board.receive_hit('A1')).to eq :hit
  end

  it 'can report if all ships are sunk' do
    board.place(sunk_ship)
    expect(board).to be_all_sunk
  end

  it 'can report if all ships are sunk' do
    board.place(ship)
    expect(board).not_to be_all_sunk
  end
end