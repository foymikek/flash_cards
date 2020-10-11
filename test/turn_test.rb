require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_turn_has_attributes
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "Juneau", turn.guess
    assert_equal card, turn.card
  end

  def test_turn_is_correct_or_not
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal true, turn.correct?
  end

  def test_feedback_is_received
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "Correct!", turn.feedback
  end

  def test_turn_is_incorrect_or_not
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    assert_equal card, turn.card
    assert_equal "Saturn", turn.guess
    assert_equal false, turn.correct?
    assert_equal "Incorrect.", turn.feedback
  end

end
