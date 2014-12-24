require 'ship'

describe Ship do

  let(:ship){Ship.new 'A1'}

  it 'has a position when created' do
    expect(ship.position).to eq 'A1'
  end

end