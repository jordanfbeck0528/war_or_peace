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

      deck1 = Deck.new(cards[0..25])
      deck2 = Deck.new(cards[26..-1])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)

      game = Game.new(player1, player2)

      # winner = turn.winner

    loop do
      if player1.has_lost?
        p "*~*~*~* #{player2} has won the game! *~*~*~*"
        break
      elsif
        player2.has_lost?
        p "*~*~*~* #{player1} has won the game! *~*~*~*"
        break
      elsif
        if @turn_counter >= 1000000
          puts "It's a draw!" && break
        end
      else
        @turn_counter += 1
      end

      winner = turn.winner

      turn.pile_cards

      # turn.award_spoils(winner)

      p "Turn #{@turn_counter}: #{"Aurora"} won #{"2"} cards"
    end
  end
end
