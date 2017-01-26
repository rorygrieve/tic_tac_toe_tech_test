class Game

  attr_reader :player1, :player2

  def initialize
    @player1 = nil
    @player2 = nil
  end

  def add_player1(player1)
    @player1 = player1
  end


end
