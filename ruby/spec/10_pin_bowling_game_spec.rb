require 'bowling_game'
require 'support/score_matcher'

describe "10-pin bowling game: " do
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

  context "rolling two spares" do
    before do
      game.roll 3, 7
      game.roll 7, 3
      game.roll 2
    end
    it ('counts the next roll double') do
      expect(game).to score (3 + 7 + 7) + (7 + 3 + 2) + 2
    end
  end

  context "rolling all fives" do
    before do
      10.times{ game.roll 5,5 }
      game.roll 5 # last roll because last frame was a spare
    end
    it ('scores 150') do
      expect(game).to score 150
    end
  end

  context "rolling a strike" do
    before do
      game.roll 10
      game.roll 2, 3
    end
    it ('counts the next two rolls double') do
      expect(game).to score (10 + 2 + 3) + (2 + 3)
    end
  end

  context "rolling a perfect game" do
    before do
      10.times{ game.roll 10 }
      game.roll 10, 10 # last two roll because last frame was a strike
    end
    it ('scores 300') do
      expect(game).to score 300
    end
  end
end
