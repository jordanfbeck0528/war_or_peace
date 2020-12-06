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

      turn.pile_cards

      if turn.type == :mutually_assured_destruction
        # require "pry"; binding.pry
        p "Turn #{@turn_counter} - *mutually_assured_destruction: 6 cards were removed from play"
      elsif
        turn.type == :basic
        winner = turn.winner

        p "Turn #{@turn_counter} - #{turn.winner.name} won 2 cards"

        turn.award_spoils(winner)
      else
        turn.type == :war
        winner = turn.winner

        p "Turn #{@turn_counter} - #{turn.type}: #{turn.winner.name} won 6 cards"

        turn.award_spoils(winner)
      end

      if player1.has_lost?
        p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
        break
      elsif
        player2.has_lost?
        p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
        break
      elsif
        if @turn_counter >= 1000000
          p "---- DRAW ----" &&
          break
        end
      else
        @turn_counter += 1
      end
    end
    # p "Thanks for playing"
    # p "Would you like to play again? If so, put yes"
    #
    # play_again_answer = gets.chomp
    #
    # if play_again_answer == "yes"
  end
end

0
# spoils_number_before_award = turn.spoils_of_war.count

# loser_deck_count = ((player1.deck.cards.count + player2.deck.cards.count) - winner.deck.cards.count)
#
# loser_1_name = player1.name if player1.deck.cards.count == loser_deck_count
#
# loser_2_name = player2.name if player2.deck.cards.count == loser_deck_count
#
# most_loser_name1 = loser_1 if most_loser != player1.name
#
# most_loser_name2 = loser_2 if most_loser != player2.name
