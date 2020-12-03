class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

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

  def award_spoils(winner)
    if winner == player1
      player1.deck.cards.push(*@spoils_of_war)
      # @spoils_of_war.clear
    elsif winner == player2
      player2.deck.cards.push(*@spoils_of_war)
      # @spoils_of_war.clear
    else
      if winner.class == String
        return nil
      end
    end
  end

  def pile_cards
    if type == :basic
      (@spoils_of_war.push player1.deck.cards.delete_at(0)) &&
      (@spoils_of_war.push player2.deck.cards.delete_at(0))
    elsif
      type == :war
        3.times { @spoils_of_war.push player1.deck.cards.slice!(0) } &&
        3.times { @spoils_of_war.push player2.deck.cards.slice!(0) }
    else
      type == :mutually_assured_destruction
      player1.deck.cards.shift(3) && player2.deck.cards.shift(3)
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

  def winner
   if type == :mutually_assured_destruction
     return 'No Winner'
   elsif type == :war
     if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
       player1
     else
       player2
     end
   else type = :basic
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
