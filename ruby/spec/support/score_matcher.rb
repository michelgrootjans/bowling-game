RSpec::Matchers.define :score do |expected|
  match do |game|
    game.score == expected
  end
end