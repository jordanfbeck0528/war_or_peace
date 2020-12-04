require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_they_exist_and_has_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    deck1 = Deck.new([card1, card3])
    deck2 = Deck.new([card2, card4])
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    game = Game.new(player1, player2)
    turn = Turn.new(player1, player2)

    assert_instance_of Game, game
    assert_instance_of Turn, turn
    assert_instance_of Player, player1
    assert_instance_of Deck, deck1
    assert_instance_of Card, card1
  end
end
