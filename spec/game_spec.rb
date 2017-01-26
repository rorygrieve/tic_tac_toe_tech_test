require 'game'

describe Game do

  let!(:game) { described_class.new }

  it "should initialize with a player 1 that equals nil" do
    expect(game.player1).to eq(nil)
  end

  it "should initialize with a player 2 that equals nil" do
    expect(game.player2).to eq(nil)
  end

end
