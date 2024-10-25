require_relative 'piece'

class Board
  attr_accessor :board, :board_piece

  def initialize
    self.board_piece = Piece.new.piece
    self.board = create_board
  end

  def create_board
    i = 0
    line = "|#{board_piece} #{board_piece} #{board_piece} #{board_piece} #{board_piece} #{board_piece} #{board_piece}|\n"
    board = ''
    while i < 5
      board += line
      i += 1
    end
    board += "|1 2 3 4 5 6 7|\n"
    board
  end
end
