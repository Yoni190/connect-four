require_relative '../lib/game'

describe Game do
    
    describe '#place_choice' do
    subject(:game_choose) {described_class.new}
        context 'when player 1 chooses 1' do
            it 'returns a new board' do
                choice = "1"
                #allow(game_choose).to receive(prompt_choice).and_return(choice)
                colored_choice = "o".colorize(:yellow)
                board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|1 o o o o o o|\n|#{colored_choice} 2 3 4 5 6 7|\n"
                new_board = game_choose.place_choice(choice)
                expect(new_board).to eql(board)
            end
        end
        context 'when player 1 chooses 6' do
            it 'returns a new board' do
                choice = "6"
                colored_choice = "o".colorize(:yellow)
                board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o 6 o|\n|1 2 3 4 5 #{colored_choice} 7|\n"
                new_board = game_choose.place_choice(choice)
                expect(new_board).to eql(board)
            end
        end
        context 'when player 2 chooses 1' do
            xit 'returns a new board' do
                turn = 1
                choice = "1"
                colored_choice = "o".colorize(:red)
                game_choose.turn = turn
                board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|1 o o o o o o|\n|#{colored_choice} 2 3 4 5 6 7|\n"
                new_board = game_choose.place_choice(choice)
                expect(new_board).to eql(board)
            end
        end
    end

    describe '#get_color' do
        subject(:game_color) {described_class.new}
        context "when it's player 1's turn " do
            it 'return a yellow piece' do
                piece = "o".colorize(:yellow)
                expect(game_color.get_color).to eql(piece)
            end
        end
    end
end