require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board_game, :p1, :p2, :turn, :stop

  def initialize
    self.board_game = Board.new
    greet_players
    self.p1 = Player.new(get_name)
    self.p2 = Player.new(get_name)
    self.turn = 0
    self.stop = 0
  end

  def play_game
    board_game.board
    while stop.zero?
      display_board
      play_round
    end
    if stop == 1
      if turn.zero?
        puts "#{p2.name} wins"
      else
        puts "#{p1.name} wins"
      end
    else
      puts "It's a tie"
    end
    display_board
    if continue?
      self.board_game = Board.new
      self.stop = 0
      play_game
    else
      puts 'Goodbye'
      0
    end
  end

  private

  def continue?
    puts 'Do you want to continue?(Y/n)'
    response = gets.chomp.downcase
    response == 'y'
  end

  def play_round
    choice = prompt_choice
    board_game.board = place_choice(choice)
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

    if win?(choice_index)
      self.stop = 1
    elsif tie?
      self.stop = 2
    end
    board
  end

  def win?(choice)
    board = board_game.board
    if board[choice] == board[choice + 2] && board[choice] == board[choice + 4] && board[choice] == board[choice + 6] ||
       board[choice] == board[choice + 2] && board[choice] == board[choice + 4] && board[choice] == board[choice - 2] ||
       board[choice] == board[choice - 2] && board[choice] == board[choice - 4] && board[choice] == board[choice + 2] ||
       board[choice] == board[choice - 2] && board[choice] == board[choice - 4] && board[choice] == board[choice - 6] ||
       board[choice] == board[choice + 16] && board[choice] == board[choice + 32] && board[choice] == board[choice + 48] ||
       board[choice] == board[choice + 14] && board[choice] == board[choice + 28] && board[choice] == board[choice + 42]

      true
    else
      false
    end
  end

  def tie?
    board = board_game.board
    if board.include?('1') || board.include?('2') || board.include?('3') || board.include?('4') || board.include?('5') || board.include?('6') || board.include?('7')
      false
    else
      true
    end
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
      'x'
    elsif turn == 1
      self.turn = 0
      'y'
    end
  end

  def prompt_choice
    puts 'Choose your placement: '
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
    puts 'Enter your name Player:'
    gets.chomp
  end

  def display_board
    puts board_game.board + "\n"
  end
end
