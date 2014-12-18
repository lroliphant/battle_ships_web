require 'cell'

describe Cell do

  let(:cell){Cell.new}

  it 'starts containing water' do
    expect(cell.contents).to eq :water
  end

  it 'can have a ship' do
    cell.place(:ship)
  end

  it 'water is reported as a miss' do
    expect(cell.receive_hit).to eq :miss
  end

  it 'ship is reported as a hit' do
    cell.place(:ship)
    expect(cell.receive_hit).to eq :hit
  end

end