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
end
