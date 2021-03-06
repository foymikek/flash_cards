require './lib/card_generator'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Whats my first cats name?", "Poppy", :Student)
# card_4 = Card.new("What is the capital of NZ", "Wellington", :Geography)
# cards = [card_1, card_2, card_3, card_4]
filename = "./lib/cards.txt"

deck = Deck.new(CardGenerator.new(filename).cards)
round = Round.new(deck)
round.start
