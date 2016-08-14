require "./lib/card.rb"

class Table

  attr_reader :cards, :deck, :player, :dealer


  VALUES = [1,2,3,4,5,6,7,8,9,10,10,10,10]
  RANKS = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
  SUITS = %w{Spades Hearts Diamonds Clubs}
  BLACKJACK = 21
  SEVENTEEN = 17

  def initialize card = Card
    @card = card
    @deck = []
    @player = []
    @dealer = []
  end

  def make_deck
    SUITS.each do |suit|
      RANKS.size.times do |i|
        @deck << @card.new(RANKS[i], suit, VALUES[i])
      end
    end
  end

  def shuffle_cards
    @deck.shuffle!
  end

  def deal_two_cards
    deal_two_cards_to_player
    deal_two_cards_to_dealer
  end

  def player_hit_card
    while player_hand_total <= SEVENTEEN do
      player_deal_one_card
    end
    raise "Dealer wins" if player_hand_total > BLACKJACK
  end

  def result_of_hand
    player_hand_total > dealer_hand_total ? "Player wins" : "Dealer wins"
  end

  def dealer_hit_card
    until player_hand_total < dealer_hand_total do
      dealer_deal_one_card
    end
    raise "Player wins the game" if dealer_hand_total > BLACKJACK
  end

  def blackjack?
    if player_blackjack?
      "Player has blackjack"
    elsif dealer_blackjack?
      "Dealer has blackjack"
    end
  end

  def dealer_hand_total
    hand_totaller @dealer
  end

  def player_hand_total
    hand_totaller @player
  end

  private

  def dealer_blackjack?
     dealer_hand_total == BLACKJACK
  end

  def player_blackjack?
      player_hand_total == BLACKJACK
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
