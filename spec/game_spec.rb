require 'game'

describe Game do

  let!(:game) { described_class.new }
  let!(:player1double) { double :player1, name: 'rory' }
  let!(:player2double) { double :player2, name: 'steve' }
  let!(:boarddouble) { double :board, show: [['','',''], ['','',''], ['','','',]] }

  context 'initialize' do

    it "should initialize with a player 1 that equals nil" do
      expect(game.player1).to eq(nil)
    end

    it "should initialize with a player 2 that equals nil" do
      expect(game.player2).to eq(nil)
    end

    it 'should initialize with a new board' do
      expect(game.board.show).to eq([['','',''], ['','',''], ['','','',]])
    end

    it "should be able to add player 1" do
      game.add_player1(player1double)
      expect(game.player1.name).to eq("rory")
    end

    it "should be able to add player 2" do
      game.add_player2(player2double)
      expect(game.player2.name).to eq("steve")
    end

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
      game.place_mark(1,1)
      expect(game.turn).to eq(player2double)
    end

    it "place mark should be able to change current turn to player1" do
      game.place_mark(1,1)
      game.place_mark(1,2)
      expect(game.turn).to eq(player1double)
    end

    it "place mark should change the board" do
      game.place_mark(2,2)
      expect(game.board.show).to eq([['','',''], ['','X',''], ['','','',]])
    end

    it "place mark should automatically switch depending on the turn" do
      game.place_mark(2,2)
      game.place_mark(2,3)
      expect(game.board.show).to eq([['','',''],['','X','O'],['','','']])
    end

    it "should raise an error if someone does not enter a number" do
      expect{game.place_mark('four',2)}.to raise_error("Cannot place mark: please enter a valid integer")
    end

    it "player should not be able to enter a number higher than 3" do
      expect{game.place_mark(4,3)}.to raise_error("Cannot place mark: both numbers needs to be either 1,2 or 3")
    end

  end

  context 'game finished' do

    before do
      game.add_player1(player1double)
      game.add_player2(player2double)
    end

    it "should return game finished when the first row is all 'X'" do
      game.place_mark(1,1)
      game.place_mark(2,1)
      game.place_mark(1,2)
      game.place_mark(2,2)
      expect(game.place_mark(1,3)).to eq("Game over: Rory wins")
    end

    it "should return game finished when the first row is all 'O'" do
      game.place_mark(2,1)
      game.place_mark(1,1)
      game.place_mark(2,2)
      game.place_mark(1,2)
      game.place_mark(3,1)
      expect(game.place_mark(1,3)).to eq("Game over: Steve wins")
    end

    it "should return game finsihed when the first column is all 'X'" do
      game.place_mark(1,1)
      game.place_mark(1,2)
      game.place_mark(2,1)
      game.place_mark(2,2)
      expect(game.place_mark(3,1)).to eq("Game over: Rory wins")
    end

    it "should return game finished when the first column is all 'O'" do
      game.place_mark(1,2)
      game.place_mark(1,1)
      game.place_mark(1,3)
      game.place_mark(2,1)
      game.place_mark(3,3)
      expect(game.place_mark(3,1)).to eq("Game over: Steve wins")
    end

    it "should return game finished when a diagonal is all 'X'" do
      game.place_mark(1,1)
      game.place_mark(1,2)
      game.place_mark(2,2)
      game.place_mark(2,3)
      expect(game.place_mark(3,3)).to eq("Game over: Rory wins")
    end

    it "should return game finished when a diagonal is all 'O'" do
      game.place_mark(1,2)
      game.place_mark(1,1)
      game.place_mark(1,3)
      game.place_mark(2,2)
      game.place_mark(3,1)
      expect(game.place_mark(3,3)).to eq("Game over: Steve wins")
    end




  end

end
