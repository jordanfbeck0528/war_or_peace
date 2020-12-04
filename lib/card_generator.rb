require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class CardGenerator
  attr_reader :card_gen
def initialize
  @card_gen =

  (
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
  )
end
end
