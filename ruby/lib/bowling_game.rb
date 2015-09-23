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
    (1..10).inject(0) { |score, frame| score += score_for(frame) } 
  end

  def score_for frame
    return 10 + strike_bonus_for(frame) if is_strike?(frame)
    return 10 + spare_bonus_for(frame)  if is_spare?(frame)

    first_roll_of(frame) + second_roll_of(frame)
  end

  def is_strike? frame
    first_roll_of(frame) == 10    
  end

  def strike_bonus_for frame
    if is_strike?(frame + 1)
      return first_roll_of(frame + 1) + first_roll_of(frame + 2) 
    end
    return first_roll_of(frame + 1) + second_roll_of(frame + 1) 
  end

  def is_spare? frame
    first_roll_of(frame) + second_roll_of(frame) == 10    
  end

  def spare_bonus_for frame
    first_roll_of(frame + 1)
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