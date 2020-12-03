require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


cards = []
suits = [:heart, :diamond, :spade, :club]
values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
rank_of_card = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}

suits.each do |suit|
  values.each do |value|
    rank = rank_of_card[value]
    cards << Card.new(suit, value, rank)
  end
end
cards = cards.shuffle

deck1 = Deck.new(cards[0..25])
deck2 = Deck.new(cards[26..-1])

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

# require "pry"; binding.pry
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

command = gets.chomp

if command == "GO"
  game = Game.new(player1, player2)
  game.start
else
  p "Maybe later then!? Until next time!"
end

# require "pry"; binding.pry
# 0
