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

  def start
    intro
    card_cycle
    outro
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

  def number_correct_by_category(by_category)
    turn_by_category = @turns.select do |turn|
        turn.card.category == by_category && turn.correct? == true
      end
    turn_by_category.count
  end

  def percent_correct
    (number_correct.to_f / (@turns.count)) * 100
  end

  def percent_correct_by_category(by_category)
    (number_correct_by_category(by_category).to_f / @deck.cards_in_category(by_category).count) * 100
  end

  def all_card_categories
    card_categories = []
    @deck.cards.each do |card|
      card_categories << card.category
    end
    card_categories.uniq
  end
end
