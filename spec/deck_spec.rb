require 'Deck'
describe Deck do
  let(:deck) {described_class.new}
  let(:hand_16) {16}
  let(:hand_17) {17}
  let(:hand_18) {19}

  xit "initalizes with 52 cards" do
    expect(deck.deck.length).to eq 52
  end
  before(:each) do
    deck.make_deck
    deck.deal_two_cards
  end


  describe "#deal_two_cards" do
    it "deals 2 cards from the deck to the player and the dealer" do
      expect(deck.player.length).to eq 2
      expect(deck.dealer.length).to eq 2
      expect(deck.deck.length).to eq 48
    end
  end
  describe "#blackjack?" do
    it "determines if the hand is blackjack" do
      deck.blackjack? deck.player
    end
  end
  describe "#player_draw_card" do
    it "deals the player another card if their hand is less than 17" do

        p deck.player
        deck.player_draw_card
        p deck.player
    end
  end
end
