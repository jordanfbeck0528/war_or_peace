class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def award_spoils(winner)
    require "pry"; binding.pry

    deck.cards.push @spoils_of_war.delete_at(0..-1)
  end
  # def award_spoils(winner)
  #   require "pry"; binding.pry
  #   winner.push @spoils_of_war.delete_at(0..-1)
  # end

  def pile_cards
    if type == :basic
      (@spoils_of_war.push player1.deck.cards.delete_at(0)) && (@spoils_of_war.push player2.deck.cards.delete_at(0))
    elsif
      type == :war
      (@spoils_of_war.push player1.deck.cards.delete_at(0..2)) && (@spoils_of_war.push player2.deck.cards.delete_at(0..2))
    else
      type == :mutually_assured_destruction
      player1.deck.cards.delete(0..2) && player2.deck.cards.delete(0..2)
    end
  end

  def winner
    if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    elsif
      player2
    elsif
      type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    elsif
      player2
    elsif
      type == :mutually_assured_destruction
      p "No Winner"
    end
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif
      player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      player1.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) ==
      player2.deck.rank_of_card_at(0) && player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end
end
