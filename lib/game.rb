require_relative 'board'
require_relative 'player'

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
        20.times do
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
        piece = get_piece

        if valid_move?(choice_index)
            board[choice_index] = piece
        else
            board[choice_index] = piece
            board[change_index] = choice
        end

        board
    end

    def valid_move?(choice)
        if [1, 3, 5, 7, 9, 11, 13].include?(choice)
            true
        else
            false
        end
    end

    def get_piece
        if turn.zero?
            self.turn = 1
            return 'x'
        elsif turn == 1
            self.turn = 0
            return 'y'
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