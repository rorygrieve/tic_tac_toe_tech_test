#manages the game including turns

require_relative './board'
require_relative './player'

class Game

  attr_reader :player1, :player2, :turn, :board

  def initialize
    @player1 = nil
    @player2 = nil
    @board = Board.new
  end

  def add_player1(player1)
    @player1 = player1
    self.turn = player1
  end

  def add_player2(player2)
    @player2 = player2
  end


  def place_mark(column, row)
    if @turn == @player1
      board.change_board(column, row, 'X')
    else
      board.change_board(column, row, 'O')
    end
    self.turn == @player1? self.turn = @player2 : self.turn = @player1
  end

  private

  attr_writer :turn


end
