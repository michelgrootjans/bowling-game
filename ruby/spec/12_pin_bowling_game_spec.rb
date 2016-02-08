require 'bowling_game'
require 'support/score_matcher'

describe '12-pin bowling game: ' do
  let(:game){ BowlingGame.new(max_pins: 12) }

  context 'rolling a spare' do
    before do
      game.roll 6, 6
      game.roll 2
    end
    it ('counts the next roll double') do
      expect(game).to score (6 + 6 + 2) + 2
    end
  end

  context 'rolling two spares' do
    before do
      game.roll 6, 6
      game.roll 7, 5
      game.roll 2
    end
    it ('counts the next roll double') do
      expect(game).to score (6 + 6 + 7) + (7 + 5 + 2) + 2
    end
  end

  context 'rolling all sixes' do
    before do
      10.times{ game.roll 6,6 }
      game.roll 6 # last roll because last frame was a spare
    end
    it { expect(game).to score 10 * (6+6+6) }
  end

  context 'rolling a strike' do
    before do
      game.roll 12
      game.roll 2, 3
    end
    it ('counts the next two rolls double') do
      expect(game).to score (12 + 2 + 3) + (2 + 3)
    end
  end

  context 'rolling a perfect game' do
    before do
      10.times{ game.roll 12 }
      game.roll 12, 12 # last two roll because last frame was a strike
    end
    it { expect(game).to score 10 * (12+12+12) }
  end
end
