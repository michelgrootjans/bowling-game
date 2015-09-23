require 'bowling_game'

describe "BowlingGame: " do
  let(:game){ BowlingGame.new }

  context 'a new game' do
    it "scores 0" do
      expect(game.score).to eq 0
    end
  end

  context "rolling a 0" do
    before { game.roll 0 }
    it 'scores 0' do
      expect(game.score).to eq 0
    end
  end

  context "rolling a gutter game" do
    before { 20.times {game.roll 0} }
    it 'scores 0' do
      expect(game.score).to eq 0
    end
  end

  context "rolling a 1" do
    before { game.roll 1 }
    it do
      expect(game.score).to eq 1
    end
  end

  it "rolling 1 twice scores 2" do
    game.roll 1
    game.roll 1
    expect(game.score).to eq 2
  end

  it "rolling 2 scores 2" do
    game.roll 2
    expect(game.score).to eq 2
  end
end
