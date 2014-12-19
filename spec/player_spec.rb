require 'player'

describe Player do

  let(:player){Player.new}

  it 'can lose' do
    expect(player.lost?).to be false
  end

  it 'can place ships' do
    player.place(Ship,'A1',:N)
  end

  it 'can tell us when a ship is hit' do
    player.place(Ship,'A1',:N)
    expect(player.receive_hit('A1')).to eq :hit
  end

  it 'can report hit positions' do
    player.place(Ship,'A1',:N)
    player.place(Ship,'B2',:N)
    player.receive_hit('A1')
    player.receive_hit('B2')
    expect(player.hits).to eq ['A1','B2']
  end

 it 'can report miss positions' do
    player.receive_hit('A1')
    player.receive_hit('B2')
    expect(player.misses).to eq ['A1','B2']
  end

  it 'will lose if all ships are hit' do
    player.place(Ship,'A1',:N)
    player.receive_hit('A1')
    expect(player.lost?).to be true
  end

end