require 'submarine'

describe Submarine do

  let(:sub){Submarine.new 'A2', :north}
  let(:sub_north){Submarine.new 'B2', :north}
  let(:sub_east){Submarine.new 'B2', :east}
  let(:sub_south){Submarine.new 'B2', :south}
  let(:sub_west){Submarine.new 'B2', :west}

  it 'has size 2' do
    expect(sub.size).to eq 2
  end

  it 'knows all positions when facing north' do
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
    expect(sub_north.hit 'B2').to eq :hit
    expect(sub_north.hit 'B1').to eq :hit
  end

  it 'should handle collisions on start position' do
    expect(sub.collided? sub).to be true
  end

  it 'should handle collisions on location other than start position' do
    expect(sub.collided? sub_west).to be true
  end

  it 'should not be able to be hit more than once in the same place' do
    sub_north.hit 'B2'
    expect(sub_north.hits).to eq ['B2']
    sub_north.hit 'B2'
    expect(sub_north.hits).to eq ['B2']
  end

end