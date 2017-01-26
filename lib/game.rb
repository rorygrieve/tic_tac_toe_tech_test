class Game

  attr_reader :player1, :player2, :turn

  def initialize
    @player1 = nil
    @player2 = nil
  end

  def add_player1(player1)
    @player1 = player1
    @turn = player1
  end

  def add_player2(player2)
    @player2 = player2
  end


  def place_mark
    if @turn == @player1
      @turn = @player2
    else
      @turn = @player1
    end
  end



end
