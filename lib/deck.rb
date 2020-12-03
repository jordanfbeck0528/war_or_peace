class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def add_card(card_number)
    @cards << card_number
  end

  def remove_card
    @cards.shift
  end

  def percent_high_ranking

    (high_ranking_cards.count / @cards.count.to_f).round(4) * 100

  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      high_cards << card if card.rank >= 11
    end
    high_cards
  end

  def rank_of_card_at(position)
    if @cards[position].nil?
      0
    else
      @cards[position].rank
    end
  end
end
