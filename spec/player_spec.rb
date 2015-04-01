require 'player'

describe Player do
  it 'can lose' do
    expect(subject.lost?).to be false
  end

  it 'can place ships' do
    subject.place(Ship, 'A1', :north)
  end

  it 'can tell us when a ship is hit' do
    subject.place(Ship, 'A1', :north)
    expect(subject.receive_hit('A1')).to eq :hit
  end

  it 'can report hit positions' do
    subject.place(Ship, 'A1', :north)
    subject.place(Ship, 'B2', :north)
    subject.receive_hit('A1')
    subject.receive_hit('B2')
    expect(subject.hits).to eq %w(A1 B2)
  end

  it 'can report miss positions' do
    subject.receive_hit('A1')
    subject.receive_hit('B2')
    expect(subject.misses).to eq %w(A1 B2)
  end

  it 'will lose if all ships are hit' do
    subject.place(Ship, 'A1', :north)
    subject.receive_hit('A1')
    expect(subject.lost?).to be true
  end

  it 'holds an index of all players' do
    player2 = described_class.new
    expect(described_class.get_player(player2.object_id)).to eq player2
    expect(described_class.get_player(subject.object_id)).to eq subject
  end

end
