require 'game'

describe Game do

  let!(:game) { described_class.new }
  let!(:player1double) { double :player1, name: 'rory' }
  let!(:player2double) { double :player2, name: 'steve' }


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

  it "should be able to add player 2" do
    game.add_player2(player2double)
    expect(game.player2.name).to eq("steve")
  end

  context 'playing a game' do

    before do
      game.add_player1(player1double)
      game.add_player2(player2double)
    end

    it "current turn should return player 1" do
      expect(game.turn).to eq(player1double)
    end

    it "place mark should change current turn" do
      game.place_mark
      expect(game.turn).to eq(player2double)
    end

    it "place mark should be able to change current turn to player1" do
      game.place_mark
      game.place_mark
      expect(game.turn).to eq(player1double)
    end

  end

end
