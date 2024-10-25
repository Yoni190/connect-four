require_relative '../lib/board'

describe Board do
  subject(:board_example) { Board.new }
  describe '#create_board' do
    it 'returns a board' do
      board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|1 2 3 4 5 6 7|\n"
      expect(board_example.create_board).to eql(board)
    end
  end
end
