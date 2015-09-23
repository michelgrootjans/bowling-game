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
    before { 20.times {game.roll 0} }
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
end
