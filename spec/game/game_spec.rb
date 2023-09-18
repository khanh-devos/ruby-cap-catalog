require_relative '../../classes/game/game'

require 'date'

describe Game do
  let(:published_date) { Date.new(2020, 1, 1) }

  let(:game) { Game.new(true, '2022-01-01', published_date) }

  describe '#initialize' do
    it 'sets the multiplayer attribute' do
      expect(game.multiplayer).to eq(true)
    end

    it 'parses the last_played_at attribute as a Date object' do
      expect(game.last_played_at).to be_a(Date)
    end

    it 'sets the published_date attribute' do
      expect(game.published_date).to eq(published_date)
    end
  end
end
