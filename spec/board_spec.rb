require 'board'

describe Board do

  let(:board){Board.new}
  let(:sunk_ship){double :ship, position: ['A1'], sunk?: true, hit: :hit}
  let(:ship){double :ship, position: ['A1'], sunk?: false, hit: :hit}
  let(:illegal_ship){double :ship, position: ['A1','@1'], sunk?: false, hit: :hit}
  let(:sub){double :sub, position: ['A1','A2'], sunk?: false, hit: :hit}
  let(:destroyer){double :destroyer, position: ['A2','B2','B2'], sunk?: false, hit: :hit}
  let(:other_destroyer){double :destroyer, position: ['A4','B4','B4'], sunk?: false, hit: :hit}

  it 'reports missed hit when no ship at position' do
    expect(board.receive_hit('A1')).to eq :miss
  end

  it 'can have a ship' do
    board.place(ship)
    expect(board.ships.first.position.first).to eq 'A1'
  end

  context 'collisions' do
    it 'does not allow ships to overlap on their starting position' do
      board.place(ship)
      expect(ship).to receive(:collided?).and_return(true)
      expect{board.place(sunk_ship)}.to raise_error 'collides with existing ship'
    end

    it 'does not allow ships to overlap on their other positions' do
      board.place(sub)
      allow(sub).to receive(:collided?).and_return(false)
      board.place(other_destroyer)
      expect(other_destroyer).to receive(:collided?).and_return(true)
      expect{board.place(destroyer)}.to raise_error 'collides with existing ship'
    end
  end

  it 'does not allow ships outside the board' do
    expect{board.place(illegal_ship)}.to raise_error 'cannot place ship outside board'
  end

  it 'can receive a hit on a ship' do
    board.place(ship)
    expect(board.receive_hit('A1')).to eq :hit
  end

  it 'can receive a hit on a sub' do
    board.place(sub)
    expect(board.receive_hit('A2')).to eq :hit
  end

  it 'can report if all ships are sunk' do
    board.place(sunk_ship)
    expect(board).to be_all_sunk
  end

  it 'can report if not all ships are sunk' do
    board.place(ship)
    expect(board).not_to be_all_sunk
  end

end