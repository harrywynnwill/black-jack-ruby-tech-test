class Card

  attr_reader :rank, :suit, :value

  def initialize rank, suit, value
    @rank = rank
    @suit = suit
    @value = value
  end

end
