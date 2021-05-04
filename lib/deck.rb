require './lib/constant'
class Deck

  #We have cards array in a deck
  attr_reader :cards
  def initialize()
    @cards = build
  end

  def to_deck(rank, suit)
    @cards << [rank, suit]
  end

  def shuffle
    @cards = @cards.shuffle
  end

  private

  #we need a combination RANKS and SUITS
  def build
    Constant::RANKS.product(Constant::SUITS).shuffle
  end

end
