require './lib/card'

class CardGenerator
  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def cards
    cards = []
    raw_string = File.readlines(filename)
    raw_string.each do |string|
      x = string.chomp.split(",")
      cards << Card.new(x[0], x[1], x[2].to_sym)
    end
    cards
  end

end
