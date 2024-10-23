require_relative 'board'
require_relative 'player'

class Game 
    attr_accessor :board
    def initialize
        board = Board.new
        greet_players
        p1 = Player.new(get_name)
        p2 = Player.new(get_name)
        
    end

    def greet_players
        greeting = "\t\s\s-----------------------------------------------------------------------------------------------\n
          | \t\t\t\t\t Connect-Four   \t\t\t\t\t|\n
          | \t\t\tConnect-Four is a game of thinkking and strategy \t\t\t|\n
          | \t\s\sBeat your opponent by aligning four pieces horizontally, vertically, or diagonally \s\s\t|\n
          -----------------------------------------------------------------------------------------------\n\n"
          puts greeting
    end

    def get_name
        puts "Enter your name Player:"
        gets.chomp
    end
end