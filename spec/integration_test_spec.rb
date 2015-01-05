describe 'Battleships'  do

  let(:player){Player.new}

  it 'should support a game with many ships being hit and missed' do
    player.place(Destroyer,'C5',:north)
    player.place(Submarine,'E7',:north)
    player.place(Destroyer,'A1',:east)
    player.place(Submarine,'F9',:west)
    player.receive_hit('A1')
    player.receive_hit('B2')
    player.receive_hit('E6')
    player.receive_hit('C4')
    player.receive_hit('E9')
    player.receive_hit('C7')
    player.receive_hit('G6')
    player.receive_hit('H7')
    expect(player.hits).to eq ['A1', 'E6', 'C4', 'E9']
    expect(player.misses).to eq ['B2', 'C7', 'G6', 'H7']
    expect(player.lost?).to be false
    player.receive_hit('B1')
    player.receive_hit('C1')
    player.receive_hit('E7')
    player.receive_hit('C5')
    player.receive_hit('C3')
    expect(player.lost?).to be false
    player.receive_hit('F9')
    expect(player.hits).to eq ['A1', 'E6', 'C4', 'E9', 'B1', 'C1', 'E7', 'C5', 'C3', 'F9']
    expect(player.lost?).to be true
  end
  
end