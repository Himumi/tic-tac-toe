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
end
