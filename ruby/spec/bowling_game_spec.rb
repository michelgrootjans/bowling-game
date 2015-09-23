require 'bowling_game'
require 'support/score_matcher'

describe "BowlingGame: " do
  let(:game){ BowlingGame.new }

  context 'a new game' do
    it { expect(game).to score 0 }
  end

  context "rolling a 0" do
    before { game.roll 0 }
    it { expect(game).to score 0 }
  end

  context "rolling a gutter game" do
    before { 10.times {game.roll 0, 0 } }
    it { expect(game).to score 0 }
  end

  context "rolling a 1" do
    before { game.roll 1 }
    it { expect(game).to score 1 }
  end

  context "rolling 1 twice scores 2" do
    before { 2.times { game.roll 1 } }
    it { expect(game).to score 2 }
  end

  context "rolling a 2" do
    before { game.roll 2 }
    it { expect(game).to score 2 }
  end

  context "rolling a spare" do
    before do
      game.roll 3, 7
      game.roll 2
    end
    it ('counts the next roll double') do
      expect(game).to score (3 + 7 + 2) + 2
    end
  end
end
