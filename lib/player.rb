class Player

  #name = Name of players
  #hand which we can later push card objects into
  #score which we can calculate highest item to define vinner
  #type is player or dealer

  attr_accessor :name, :hand, :score, :type
  def initialize(name:, type: 'player')
    @name = name
    @type = type
    @hand = []
    @score = 0
  end
end
