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
    check_number(column, row)
    check_value(column, row)
    if @turn == @player1
      board.change_board(column, row, 'X')
    else
      board.change_board(column, row, 'O')
    end
    switch_players
  end

  private

  attr_writer :turn

  def switch_players
    self.turn == @player1? self.turn = @player2 : self.turn = @player1
  end

  def check_number(column, row)
    raise "Cannot place mark: please enter a valid number" if (!column.is_a? Integer) || (!row.is_a? Integer)
  end

  def check_value(column, row)
    raise "Cannot place mark: both numbers needs to be either 1,2 or 3" if column < 1 || column > 3 || row < 1 || row > 3
  end

end
