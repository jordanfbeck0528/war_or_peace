class Player
  attr_reader :name, :deck, :has_lost
  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

  def remove_card
    deck.cards.shift  
  end

  def has_lost?
    if deck.cards.count == 0
      @has_lost = true
    else
      @has_lost
    end
  end
end
