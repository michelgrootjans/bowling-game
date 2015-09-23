describe "BowlingGame" do
  def score
    0
  end

  def roll pins
  end

  it "scores 0" do
    expect(score).to eq 0
  end

  it "rolling a 0 scores 0" do
    roll 0
    expect(score).to eq 0
  end

  it "rolling a gutter game scores 0" do
    10.times do 
      roll 0
      roll 0
    end

    expect(score).to eq 0
  end
end
