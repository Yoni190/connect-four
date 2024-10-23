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

    def play_game
        7.times do
        display_board
        play_round
        end
    end

    def play_round
        choice = prompt_choice
        self.board_game.board = place_choice(choice)
    end

    def place_choice(choice)
        board = board_game.board
        choice_index = board.index(choice)
        change_index = choice_index - 16
        colorized_choice = get_color

        board[choice_index] = colorized_choice
        board[change_index] = choice

        board
    end

    def get_color
        if turn.zero?
            self.turn = 1
            return 'o'.colorize(:yellow)
        elsif turn == 1
            self.turn = 0
            return 'o'.colorize(:red)
        end
    end

    def prompt_choice
        puts "Choose your placement: "
        gets.chomp
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
        puts board_game.board + "\n"
    end
end