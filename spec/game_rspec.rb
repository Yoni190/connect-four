require_relative '../lib/game'

describe Game do
    
    describe '#place_choice' do
    subject(:game_choose) {described_class.new}
        context 'when player 1 chooses' do
            it 'returns a new board' do
                choice = "1"
                #allow(game_choose).to receive(prompt_choice).and_return(choice)
                board = "|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|o o o o o o o|\n|1 o o o o o o|\n|o 2 3 4 5 6 7|\n"
                new_board = game_choose.place_choice(choice)
                expect(new_board).to eql(board)
            end
        end
    end
end