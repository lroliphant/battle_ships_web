require 'board'

describe Board do

  let(:sunk_ship) { double :ship, position: ['A1'], sunk?: true, hit: :hit }
  let(:ship) { double :ship, position: ['A1'], sunk?: false, hit: :hit }
  let(:illegal_ship) do
    double :ship, position: %w(A1 @1), sunk?: false, hit: :hit
  end
  let(:sub) { double :sub, position: %w(A1 A2), sunk?: false, hit: :hit }
  let(:destroyer) do
    double :destroyer, position: %w(A2 B2 B2), sunk?: false, hit: :hit
  end
  let(:other_destroyer) do
    double :destroyer, position: %w(A4 B4 B4), sunk?: false, hit: :hit
  end

  it 'reports missed hit when no ship at position' do
    expect(subject.receive_hit('A1')).to eq :miss
  end

  it 'can have a ship' do
    subject.place(ship)
    expect(subject.ships.first.position.first).to eq 'A1'
  end

  context 'collisions' do
    it 'does not allow ships to overlap on their starting position' do
      subject.place(ship)
      expect(ship).to receive(:collided?).and_return(true)
      expect do
        subject.place(sunk_ship)
      end.to raise_error 'collides with existing ship'
    end

    it 'does not allow ships to overlap on their other positions' do
      subject.place(sub)
      allow(sub).to receive(:collided?).and_return(false)
      subject.place(other_destroyer)
      expect(other_destroyer).to receive(:collided?).and_return(true)
      expect do
        subject.place(destroyer)
      end.to raise_error 'collides with existing ship'
    end
  end

  it 'does not allow ships outside the board' do
    expect do
      subject.place(illegal_ship)
    end.to raise_error 'cannot place ship outside board'
  end

  it 'can receive a hit on a ship' do
    subject.place(ship)
    expect(subject.receive_hit('A1')).to eq :hit
  end

  it 'can receive a hit on a sub' do
    subject.place(sub)
    expect(subject.receive_hit('A2')).to eq :hit
  end

  it 'can report if all ships are sunk' do
    subject.place(sunk_ship)
    expect(subject).to be_all_sunk
  end

  it 'can report if not all ships are sunk' do
    subject.place(ship)
    expect(subject).not_to be_all_sunk
  end

end
