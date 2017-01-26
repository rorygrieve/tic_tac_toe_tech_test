#stores the actions of the players

class Board

  attr_reader :show

  def initialize
    @show = [['','',''], ['','',''], ['','','',]]
  end

  def change_board(row, column, input)
    raise 'Cannot place mark there: already a mark there' if @show[row-1][column-1] != ''
    @show[row-1][column-1] = input
  end

end
