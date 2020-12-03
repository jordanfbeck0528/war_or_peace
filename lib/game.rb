require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_counter = 0
  end

  def start
    p "Alright, let's goooooooo!!!"

      turn = Turn.new(player1, player2)

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

      cards = cards.shuffle!

      winner = turn.winner

      deck1 = Deck.new(cards[0..25])
      deck2 = Deck.new(cards[26..-1])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      game = Game.new(player1, player2)

    loop do
      turn = Turn.new(player1, player2)
      winner = turn.winner
      if player1.has_lost?
        p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
        break
      elsif
        player2.has_lost?
        p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
        break
      elsif
        if @turn_counter >= 1000000
          puts "It's a draw!" && break
        end
      else
        @turn_counter += 1
      end

      turn.pile_cards

      if turn.type == :mutually_assured_destruction
        p "Turn #{@turn_counter} - #{turn.type}: Nobody won any cards"
        turn.award_spoils(winner)
      else
        winner = turn.winner

        p "Turn #{@turn_counter}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
        turn.award_spoils(winner)
      end
    end
  end
end

#
# spoils_number_before_award = turn.spoils_of_war.count
#
# loser_number = ((player1.deck.cards.count + player2.deck.cards.count) - winner.deck.cards.count)
#
# loser_1 = player1.name if player1.deck.cards.count == loser_number
#
# loser_2 = player2.name if player2.deck.cards.count == loser_number
#
# most_loser = loser_1 if most_loser != player1.name
#
# most_loser = loser_2 if most_loser != player2.name
