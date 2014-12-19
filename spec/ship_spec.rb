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
  let(:sub){Submarine.new 'A2', :N}
  let(:sub_north){Submarine.new 'B2', :N}
  let(:sub_east){Submarine.new 'B2', :E}
  let(:sub_south){Submarine.new 'B2', :S}
  let(:sub_west){Submarine.new 'B2', :W}
  it 'has size 2' do
    expect(sub.size).to eq 2
  end

  it 'knows all positions based on direction' do
    expect(sub_north.position).to eq ['B2','B1']
  end

  it 'knows all positions when facing east' do
    expect(sub_east.position).to eq ['B2','C2']
  end

  it 'knows all positions when facing south' do
    expect(sub_south.position).to eq ['B2','B3']
  end

  it 'knows all positions when facing west' do
    expect(sub_west.position).to eq ['B2','A2']
  end

  it 'gets hit in any of the positions it is in' do
    expect(sub_north.hit 'B1').to eq :hit
  end
end