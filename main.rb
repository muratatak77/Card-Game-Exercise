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
    $stdout.puts "  Join #{player_name}."
    i += 1
  end
  dealer_name = "Dealer"
  @players << Player.new(name: dealer_name, type: 'dealer')
  $stdout.puts "  Join #{dealer_name}."
  $stdout.puts "Joined to the game 5 players and dealer."
  $stdout.puts "=============================================================="
  setup_game
end

def setup_game
  $stdout.puts "Starting to deal 2 cards per player."
  $stdout.puts "=============================================================="

  @game_engine = GameEngine.new(deck: @deck, players: @players)
  @game_engine.deal()
  print_hands
  calc_score
end

def print_hands
  $stdout.puts "Every hand has own cards."
  @players.each do |player|
    $stdout.puts " #{player.name} - Hand : #{player.hand}"
  end
  $stdout.puts "=============================================================="
  
end

def calc_score
  $stdout.puts "!! Score has been Calculating !!"
  $stdout.puts "=============================================================="
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
