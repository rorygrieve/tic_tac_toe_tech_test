#stores the actions of the players

class Board

  attr_reader :show

  def initialize
    @show = [['','',''], ['','',''], ['','','',]]
  end

  def change_board(column, row)
    @show[column-1][row-1] = 'X'
  end

end
