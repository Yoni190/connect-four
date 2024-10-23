require_relative 'board'
require_relative 'player'

class Game 
    attr_accessor :board
    def initialize
        board = Board.new
        p1 = Player.new
        p2 = Player.new
    end
end