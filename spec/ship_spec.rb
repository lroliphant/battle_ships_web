require 'ship'

describe Ship do

  let(:ship){Ship.new 'A1', :N}

  it 'can have a position set' do
    expect(ship.position).to eq 'A1'
  end

  it 'can be hit' do
    expect(ship.hit 'A1').to eq :hit
  end

  it 'will record number of hits' do
    ship.hit 'A1'
    expect(ship.hits).to eq 1
  end

  it 'can be missed' do
    expect(ship.hit 'B1').to eq :miss
  end

  it 'will not be hit when it is missed' do
    ship.hit 'B1'
    expect(ship.hits).to eq 0
  end

  it 'is not sunk initially' do
    expect(ship).not_to be_sunk
  end

  it 'can be sunk' do
    ship.hit 'A1'
    expect(ship).to be_sunk
  end

end

describe Submarine do
  let(:sub){Submarine.new 'A1', :N}
  it 'has size 2' do
    expect(sub.size).to eq 2
  end

  xit 'knows all positions based on direction' do
  end

  xit 'gets hit in any of the positions it is in' do
  end
end