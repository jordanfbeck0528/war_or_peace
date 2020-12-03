class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def award_spoils(winner)
    @spoils_of_war.map do |spoils|
      # require "pry"; binding.pry
      winner.deck.cards << spoils
    end
    @spoils_of_war.clear
  end

  def pile_cards
    if type == :basic
      (@spoils_of_war.push player1.deck.cards.shift(0)) &&
      (@spoils_of_war.push player2.deck.cards.shift(0))
    elsif
      type == :war
        @spoils_of_war.push player1.deck.cards.slice!(0)
        @spoils_of_war.push player1.deck.cards.slice!(0)
        @spoils_of_war.push player1.deck.cards.slice!(0)
        @spoils_of_war.push player2.deck.cards.slice!(0)
        @spoils_of_war.push player2.deck.cards.slice!(0)
        @spoils_of_war.push player2.deck.cards.slice!(0)
    else
      type == :mutually_assured_destruction
      player1.deck.cards.shift(3) && player2.deck.cards.shift(3)
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      p  player1
      elsif
      p  player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      p  player1
      else
      p  player2
      end
    else
      type == :mutually_assured_destruction
    p  "No Winner"
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
