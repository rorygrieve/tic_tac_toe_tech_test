#manages the game including turns

require_relative './board'
require_relative './player'
require_relative './calculation'

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


  def place_mark(row, column)
    check_number(row, column)
    check_value(row, column)
    if @turn == @player1
      board.change_board(row, column, 'X')
    else
      board.change_board(row, column, 'O')
    end
    if game_over?
      "Game over: #{@turn.name.capitalize} wins"
    else
      switch_players
    end
  end

  private

  attr_writer :turn

  def switch_players
    self.turn == @player1? self.turn = @player2 : self.turn = @player1
  end

  def check_number(row, column)
    raise "Cannot place mark: please enter a valid integer" if (!column.is_a? Integer) || (!row.is_a? Integer)
  end

  def check_value(row, column)
    raise "Cannot place mark: both numbers needs to be either 1,2 or 3" if column < 1 || column > 3 || row < 1 || row > 3
  end

  def game_over?
    if @turn == @player1
      player_wins?('X')
    else
      player_wins?('O')
    end
  end

  def player_wins?(letter)
    [letter,letter,letter] == @board.show[0] || [letter,letter,letter] ==  @board.show[1] || [letter,letter,letter] ==  @board.show[2] || [letter,letter,letter] == @board.show.map{|row| row[0]} || [letter,letter,letter] == @board.show.map{|row| row[1]} || [letter,letter,letter] == @board.show.map{|row| row[2]} || letter*3 == @board.show[0][0] + @board.show[1][1] + @board.show[2][2] || letter*3 == @board.show[0][2] + @board.show[1][1] + @board.show[2][0]
  end



end
