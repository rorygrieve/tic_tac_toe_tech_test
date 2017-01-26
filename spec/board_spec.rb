require 'board'

describe Board do

  let!(:board) { described_class.new }

context 'set up' do

  it "should initialize with a multi-dimensional array" do
    expect(board.show).to eq([['','',''], ['','',''], ['','','',]])
  end

end

end
