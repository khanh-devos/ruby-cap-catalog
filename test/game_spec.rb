require_relative '../classes/game'


RSpec.describe Game do
  let(:item_type) { 'Video Game' }
  let(:published_date) { '2022-01-01' }
  let(:multiplayer) { true }
  let(:last_played_at) { Time.new(2023, 1, 1) }

  subject(:game) { described_class.new(item_type, published_date, multiplayer, last_played_at) }

  describe '#initialize' do
    it 'sets the item type, published date, multiplayer, and last played at attributes' do
      expect(game.type).to eq(item_type)
      expect(game.published_date).to eq(published_date)
      expect(game.multiplayer).to eq(multiplayer)
      expect(game.last_played_at).to eq(last_played_at)
    end

    context 'when last played at is not provided' do
      let(:last_played_at) { nil }

      it 'does not set the last played at attribute' do
        expect(game.last_played_at).to be_nil
      end
    end
  end

  describe '#can_be_archived?' do
    context 'when last played at is within the last 2 years' do
      let(:last_played_at) { Time.now }

      it 'returns false' do
        expect(game.send(:can_be_archived?)).to be_falsey
      end
    end

    context 'when last played at is more than 2 years ago' do
      let(:last_played_at) { Time.new(2020, 1, 1) }

      it 'returns true' do
        expect(game.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when last played at is not provided' do
      let(:last_played_at) { nil }

      it 'returns false' do
        expect(game.send(:can_be_archived?)).to be_falsey
      end
    end
  end
end
