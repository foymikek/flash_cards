require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess_string)
    new_turn = Turn.new(guess_string, current_card)
    @turns << new_turn
    @turns.last
  end

  def number_correct
    number_correct = 0
    @turns.each do |turn|
      number_correct += 1 if turn.feedback == 'Correct!'
    end
    number_correct
  end
end
