require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_has_attributes
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).cards
  end
  
end
