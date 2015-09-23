require 'bowling_game'
require 'support/score_matcher'

describe "20-frames bowling game: " do
  let(:game){ BowlingGame.new(number_of_frames: 20) }

  context "rolling all fives" do
    before do
      20.times{ game.roll 5,5 }
      game.roll 5 # last roll because last frame was a spare
    end
    it { expect(game).to score 300 }
  end

  context "rolling a perfect game" do
    before do
      20.times{ game.roll 10 }
      game.roll 10, 10 # last two roll because last frame was a strike
    end
    it { expect(game).to score 600 }
  end
end
