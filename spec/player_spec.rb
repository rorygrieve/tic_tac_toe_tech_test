require 'player'

describe Player do

  let!(:player) { described_class.new("rory") }

  it "should intialize with a name" do
    expect(player.name).to eq("rory")
  end

end
