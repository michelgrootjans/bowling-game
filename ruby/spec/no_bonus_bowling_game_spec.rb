require 'bowling_game'
require 'support/score_matcher'

describe "bowling game without bonuses: " do
  let(:game){ BowlingGame.new(ignore_bonuses: true) }

  context "rolling a spare" do
    before do
      game.roll 3, 7
      game.roll 2
    end
    it ('counts no bonus') do
      expect(game).to score (3 + 7) + 2
    end
  end

  context "rolling two spares" do
    before do
      game.roll 3, 7
      game.roll 7, 3
      game.roll 2
    end
    it ('counts no bonus') do
      expect(game).to score (3 + 7) + (7 + 3) + 2
    end
  end

  context "rolling all fives" do
    before do
      10.times{ game.roll 5,5 }
    end
    it { expect(game).to score 100 }
  end

  context "rolling a strike" do
    before do
      game.roll 10
      game.roll 2, 3
    end
    it ('counts no bonus') do
      expect(game).to score (10) + (2 + 3)
    end
  end

  context "rolling a perfect game" do
    before do
      10.times{ game.roll 10 }
    end
    it { expect(game).to score 100 }
  end
end
