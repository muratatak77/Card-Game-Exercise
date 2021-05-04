require './lib/player'
require './lib/game_engine'
require './lib/deck'

@deck = Deck.new
@players = []

def start_game
  join_players_and_dealer
end

private

def join_players_and_dealer
  i = 1
  5.times do
    player_name = "Player #{i}"
    @players << Player.new(name: player_name)
    i += 1
  end
  dealer_name = "Dealer"
  @players << Player.new(name: dealer_name, type: 'dealer')
  $stdout.puts "Joined to the game 5 players and dealer."
  setup_game
end

def setup_game
  @game_engine = GameEngine.new(deck: @deck, players: @players)
  @game_engine.deal()
  calc_score
end

def calc_score
  @game_engine.calculate_score
  finish
end

#Between hands, all cards return to the deck, which must be then shuffled
#The winner is announced at the end of each hand
def finish
  winner = @game_engine.winner
  $stdout.puts "Winner is #{winner.name}. Score : #{winner.score}"
  $stdout.puts "Winner is hand : #{winner.hand}"
  @deck = Deck.new
end

start_game
