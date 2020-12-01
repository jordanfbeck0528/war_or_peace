require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
class PlayerTest < Minitest::Test
  def test_it_exists_and_has_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
    assert_equal "Clarisa", player.name
    assert_equal deck, player.deck
  end

  def test_it_has_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?
    assert_equal card1, player.deck.remove_card
    assert_equal false, player.has_lost?
    assert_equal card2, player.deck.remove_card
    assert_equal false, player.has_lost?
    assert_equal card3, player.deck.remove_card
    assert_equal true, player.has_lost?
    assert_equal deck, player.deck
  end

  def test_it_can_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal card1, player.deck.remove_card
  end
end
