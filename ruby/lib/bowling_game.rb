class BowlingGame
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll *rolls
    rolls.each do |pins|
      @rolls << pins
      @rolls << 0 if pins == 10
    end
  end

  def score
    score = 0
    (1..10).each do |frame|
      score += score_for(frame)
    end
    score
  end

  def score_for frame
    return 10 + first_roll_of(frame + 1) + second_roll_of(frame + 1) if is_strike? frame
    return 10 + first_roll_of(frame + 1) if is_spare? frame

    first_roll_of(frame) + second_roll_of(frame)
  end

  def is_strike? frame
    first_roll_of(frame) == 10    
  end

  def is_spare? frame
    first_roll_of(frame) + second_roll_of(frame) == 10    
  end

  def first_roll_of frame
    roll_number((frame - 1) * 2)
  end

  def second_roll_of frame
    roll_number((frame - 1) * 2 + 1)
  end

  def roll_number index
    @rolls[index] || 0
  end
end