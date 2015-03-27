require 'ship'

describe Ship do

  let(:ship) { described_class.new 'A1', :north }

  it 'has a position when created' do
    expect(ship.position).to eq ['A1']
  end

  it 'can be hit' do
    expect(ship.hit 'A1').to eq :hit
  end

  it 'will record number of hits' do
    ship.hit 'A1'
    expect(ship.hits).to eq ['A1']
  end

  it 'can be missed' do
    expect(ship.hit 'B1').to eq :miss
  end

  it 'will not be hit when it is missed' do
    ship.hit 'B1'
    expect(ship.hits).to eq []
  end

  it 'is not sunk initially' do
    expect(ship).not_to be_sunk
  end

  it 'can be sunk' do
    ship.hit 'A1'
    expect(ship).to be_sunk
  end

  it 'can be collided with' do
    expect(ship).to be_collided described_class.new 'A1', :S
  end

end
