require 'board'

describe Board do

  let!(:board) { described_class.new }

  context 'set up' do

    it "should initialize with a multi-dimensional array" do
      expect(board.show).to eq([['','',''], ['','',''], ['','','',]])
    end

  end

  context 'using the board' do

    it "should be able to change the board" do
      board.change_board(2, 2, 'X')
      expect(board.show).to eq([['','',''], ['','X',''], ['','','',]])
    end

    it 'should stop someone from placing a mark where there already is one' do
      board.change_board(2, 2, 'X')
      expect{board.change_board(2, 2, 'O')}.to raise_error('Cannot place mark there: already a mark there')
    end




  end

end
