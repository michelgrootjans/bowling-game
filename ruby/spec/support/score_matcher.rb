RSpec::Matchers.define :score do |expected_score|
  match do |game|
    game.score == expected_score
  end

  failure_message_for_should do |game|
    "expected game to score #{expected_score}, but it scored #{game.score}\r\n" + 
    "state was: #{game.rolls}"
  end
end