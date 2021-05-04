class GameEngine
  require './lib/constant'

  attr_reader :deck, :players

  def initialize(deck:, players:)
    @deck = deck
    @players = players
  end

  #Deal 2 cards per player in a round robin manner
  #we have 6 players
  def deal()
    loop_size = Constant::CARD_COUNT / 6
    loop_size.times do
      @players.each do |player|
        break if @deck.cards.empty?
        player.hand += @deck.cards.pop(2)
      end
    end
  end

  def calculate_score
    @players.each do |player|
      player.hand.each do |rank, suit|
        player.score += check_values(rank)
      end
    end
  end

  #The highest hand wins
  def winner
    @players.max_by{ |player| player.score}
  end

  private

  def check_values(rank)
    case rank
    when 'K' then 13
    when 'Q' then 12
    when 'J' then 11
    when 'A' then 1
    else rank.to_i
    end
  end

end
