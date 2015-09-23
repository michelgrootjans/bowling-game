class BowlingGame
  attr_reader :score

  def initialize
    @score = 0
    @frame = []
  end

  def roll pins
    if @frame.size > 1
      @score += pins if @frame[0] + @frame[1] == 10
    end
    @score += pins
    @frame << pins
  end
end