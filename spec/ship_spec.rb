require 'ship'

describe Ship do

  let(:ship){Ship.new 'A1'}

  it 'can have a position set' do
    expect(ship.position).to eq 'A1'
  end

end