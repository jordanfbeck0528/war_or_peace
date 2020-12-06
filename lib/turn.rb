class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @destroyed_cards = 0
  end

  def award_spoils(winner)
    if winner == player1
      player1.deck.cards.push(*@spoils_of_war)
    elsif winner == player2
      player2.deck.cards.push(*@spoils_of_war)
    end
  end

  def pile_cards
    if
      type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif
      type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    else
      type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
        @destroyed_cards += 6
      end
    end
  end

  def winner
    if type == :mutually_assured_destruction
      p 'No Winner this turn'
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    else type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    end
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif
      player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end
end
# def winner
#   # require "pry"; binding.pry
#   if type == :basic
#     if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
#       player1
#     elsif
#       player2
#     end
#   elsif type == :war
#     if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
#       player1
#     else
#       player2
#     end
#   else
#     type == :mutually_assured_destruction
#     "No Winner"
#   end
# end


# def award_spoils(winner)
#   if winner.class == String
#     p "Sorry, no spoils this time"
#   else
#     @spoils_of_war.select do |spoils|
#       winner.deck.cards << spoils
#     end
#     @spoils_of_war.clear
#   end
# end
