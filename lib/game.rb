class Game

  attr_reader :player1, :player2

  def initialize
    @player1 = nil
    @player2 = nil
  end

  def add_player1(player1)
    @player1 = player1
  end

  def add_player2(player2)
    @player2 = player2
  end




end
