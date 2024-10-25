require_relative '../lib/game'

describe Game do
  describe '#place_choice' do
    subject(:game_choose) { described_class.new }
    context 'when player 1' do
      it 'returns a new board choosing 1' do
        choice = '1'
        # allow(game_choose).to receive(prompt_choice).and_return(choice)
        colored_choice = 'o'.colorize(:yellow)
        board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|1 o o o o o o|\n|#{colored_choice} 2 3 4 5 6 7|\n"
        new_board = game_choose.place_choice(choice)
        expect(new_board).to eql(board)
      end
      it 'returns a new board choosing 6' do
        choice = '6'
        colored_choice = 'o'.colorize(:yellow)
        board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o 6 o|\n|1 2 3 4 5 #{colored_choice} 7|\n"
        new_board = game_choose.place_choice(choice)
        expect(new_board).to eql(board)
      end
    end
    context 'when player 2 chooses 1' do
      it 'returns a new board choosing 1' do
        turn = 1
        choice = '1'
        colored_choice = 'o'.colorize(:red)
        game_choose.turn = turn
        board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|1 o o o o o o|\n|#{colored_choice} 2 3 4 5 6 7|\n"
        new_board = game_choose.place_choice(choice)
        expect(new_board).to eql(board)
      end
      it 'returns a new board choosing 6' do
        turn = 1
        choice = '6'
        colored_choice = 'o'.colorize(:red)
        game_choose.turn = turn
        board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o 6 o|\n|1 2 3 4 5 #{colored_choice} 7|\n"
        new_board = game_choose.place_choice(choice)
        expect(new_board).to eql(board)
      end
    end
    context 'when player 1 chooses the last place possible' do
      xit "doesn't allow him to choose 1 anymore" do
        choice = '1'
        p1_choice = 'o'.colorize(:yellow)
        p2_choice = 'o'.colorize(:red)
        game_choose.board_game.board = "|1 o o o o o o|\n|#{p1_choice} o o o o o o|\n|#{p2_choice} o o o o o o|\n|#{p1_choice} o o o o o o|\n|#{p2_choice} o o o o o o|\n|#{p1_choice} 2 3 4 5 6 7|\n"
        board = "|#{p2_choice} o o o o o o|\n|#{p1_choice} o o o o o o|\n|#{p2_choice} o o o o o o|\n|#{p1_choice} o o o o o o|\n|#{p2_choice} o o o o o o|\n|#{p1_choice} 2 3 4 5 6 7|\n"
        new_board = game_choose.place_choice(choice)
        expect(new_board).to eql(board)
      end
    end
    context 'when player 2 chooses 1 and 6' do
      xit 'return a new board' do
        choice = '6'
        p1_choice = 'o'.colorize(:yellow)
        p2_choice = 'o'.colorize(:red)
        game_choose.board_game.board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|1 o o o o o o|\n|#{p1_choice} 2 3 4 5 6 7|\n"
        board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|1 o o o o 6 o|\n|#{p1_choice} 2 3 4 5 #{p2_choice} 7|\n"
        new_board = game_choose.place_choice(choice)
        expect(new_board).to eql(board)
      end
    end
  end

  describe '#get_color' do
    subject(:game_color) { described_class.new }
    context "when it's player 1's turn " do
      it 'return a yellow piece' do
        piece = 'o'.colorize(:yellow)
        expect(game_color.get_color).to eql(piece)
      end
    end
  end

  describe '#count_chars' do
    subject(:game_count) { described_class.new }
    context "when player1 has chosen and its player2's turn" do
      it 'returns 27' do
        char = 27
        counted = game_count.count_chars
        expect(counted).to eql(char)
      end
    end
  end
end
