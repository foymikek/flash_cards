require './lib/card'
require './lib/turn'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(card_category)
    @cards.select do |card|
      card.category == card_category
    end
  end

end
