require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
# require './war_or_peace_runner'
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

  # def test_players_take_turn_in_game
  #   cards = []
  #   suits = [:heart, :diamond, :spade, :club]
  #   values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  #   rank_of_card = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}
  #
  #   suits.each do |suit|
  #     values.each do |value|
  #       rank = rank_of_card[value]
  #       cards << Card.new(suit, value, rank)
  #     end
  #   end
  #
  #   cards = cards.shuffle
  #
  #   deck1 = Deck.new(cards[0..25])
  #   deck2 = Deck.new(cards[26..-1])
  #
  #   player1 = Player.new('Megan', deck1)
  #   player2 = Player.new('Aurora', deck2)
  #
  #   game = Game.new(player1, player2)
  #   turn = Turn.new(player1, player2)
  #
  #   turn.player1
  #
  #   turn.player2
  #
  #   turn.spoils_of_war
  #
  #   turn.winner
  #
  #   turn.pile_cards
  #
  #   turn.spoils_of_war
  #
  #
  # end
end
