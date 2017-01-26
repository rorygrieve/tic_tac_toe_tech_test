#manages the game including turns

require_relative './board'
require_relative './player'

class Game

  attr_reader :player1, :player2, :turn

  def initialize
    @player1 = nil
    @player2 = nil
  end

  def add_player1(player1)
    @player1 = player1
    self.turn = player1
  end

  def add_player2(player2)
    @player2 = player2
  end


  def place_mark
    self.turn == @player1? self.turn = @player2 : self.turn = @player1
  end

  private

  attr_writer :turn


end
