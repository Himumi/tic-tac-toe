require './lib/tic_tac_toe'

describe Game do
  subject(:game) { described_class.new }

  describe '#valid_input' do
    context 'when user inputs valid value' do
      it 'returns true' do
        value = 5
        check_value = game.valid_input(value)
        expect(check_value).to be true
      end
    end

    context 'when user inputs invalid value' do
      it 'returns false' do
        value = 'a'
        check_value = game.valid_input(value)
        expect(check_value).not_to be true
      end
    end
  end

  describe '#get_input' do
    context 'when user inputs valid value' do
      before do
        valid_value = "5"
        allow(game).to receive(:gets).and_return(valid_value)
      end

      it 'stops loop and return input' do
        error_message = "You Input wrong value. You have to input between 1 - 9."
        expect(game).not_to receive(:puts).with(error_message)
        game.get_input
      end
    end

    context 'when user inputs invalid value' do
      before do
        invalid_value = "g"
        valid_value = "5"
        allow(game).to receive(:gets).and_return(invalid_value, valid_value)
      end

      it 'shows error message for once' do
        error_message = "You Input wrong value. You have to input between 1 - 9."
        expect(game).to receive(:puts).with(error_message).exactly(1).times
        game.get_input
      end
    end

  end

  describe '#add_to_display' do
    context 'when adds player mark into board' do
      let(:position) { 5 }
      let(:player_mark) { 'x' }
      before do
        game.add_to_display(position, player_mark)
      end

      it 'adds into board' do
        board = game.instance_variable_get(:@board)
        inputed_position = board[position]
        expect(inputed_position).to eq(player_mark)
      end
    end
  end

  describe '#current_player' do
    context 'when current count is odd' do
      it 'returns first player mark' do
        first_player = game.instance_variable_get(:@first_player)
        count = 5
        result = game.current_player(count)
        expect(result).to eq(first_player)
      end
    end

    context 'when current count is even' do
      it 'returns last player mark' do
        last_player = game.instance_variable_get(:@last_player)
        count = 6
        result = game.current_player(count)
        expect(result).to eq(last_player)
      end
    end
  end
end
