require 'game'

describe Game do

  let!(:game) { described_class.new }
  let!(:player1double) { double :player, name: 'rory' }


  it "should initialize with a player 1 that equals nil" do
    expect(game.player1).to eq(nil)
  end

  it "should initialize with a player 2 that equals nil" do
    expect(game.player2).to eq(nil)
  end

  it "should be able to add player 1" do
    game.add_player1(player1double)
    expect(game.player1.name).to eq("rory")
  end

end
