require "./lib/card.rb"

class Deck

  attr_reader :cards, :deck, :player, :dealer

  VALUES = [11,2,3,4,5,6,7,8,9,10,10,10,10]
  RANKS = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
  SUITS = %w{Spades Hearts Diamonds Clubs}

  def initialize card = Card
    @card = card
    @deck = []
    @player = []
    @dealer = []
  end

  def make_deck
    SUITS.each do |suit|
      RANKS.size.times do |i|
        @deck << @card.new(RANKS[i], suit, VALUES[i] )
      end
    end
  end

  def player_hit_card
    player_total = hand_totaller @player
    raise "you have lost the game" if player_total > 21
    raise "your hand is 17 or more" if player_total >= 17
    player_deal_one_card if player_total <= 17
  end

  def dealer_take_card
    while player_hand_total < dealer_hand_total do
      dealer_deal_one_card
    end
  end

  def shuffle_cards
    @deck.shuffle!
  end
  def blackjack? cards
    total = hand_totaller cards
    total == 21
  end

  def deal_two_cards
    deal_two_cards_to_player
    deal_two_cards_to_dealer
  end

  def dealer_hand_total
    hand_totaller @dealer
  end

  def player_hand_total
    hand_totaller @player
  end


  def hand_totaller cards
    hand_total = []
    cards.each do |card|
      hand_total << card.value
    end
    hand_total.inject {|total, value| total += value}
  end

  def deal_two_cards_to_player
      2.times { player_deal_one_card }
  end

  def deal_two_cards_to_dealer
      2.times { dealer_deal_one_card}
  end

  def dealer_deal_one_card
    @dealer << @deck.pop
  end

  def player_deal_one_card
    @player << @deck.pop
  end
end
