require_relative 'board'
require_relative 'player'
require 'colorize'

class Game 
    attr_accessor :board_game, :p1, :p2, :turn
    def initialize
        self.board_game = Board.new
        greet_players
        self.p1 = Player.new(get_name)
        self.p2 = Player.new(get_name)
        self.turn = 0
    end

    def play_round
        display_board
    end

    def place_choice(choice)
        board = board_game.board
        choice_index = board.index(choice)
        change_index = choice_index - 16
        colorized_choice = 'o'.colorize(:yellow)

        board[choice_index] = colorized_choice
        board[change_index] = choice

        board
    end

    def prompt_choice
        put "Choose your placement: "
        gets.chomp
    end

    def play_game
        display_board
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

    def display_board
        puts board_game.board
    end
end