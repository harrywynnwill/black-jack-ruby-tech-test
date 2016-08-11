require 'Deck'
describe Table do
  let(:table) {described_class.new}
  let(:card ) {double :card}
  let(:hand_17) {17}
  let(:hand_18) {19}

  xit "initalizes with 52 cards" do
    expect(table.deck.length).to eq 52
  end
  before(:each) do
    table.make_deck
    table.deal_two_cards
  end


  describe "#deal_two_cards" do
    it "deals 2 cards from the deck to the player and the dealer" do
      expect(table.player.length).to eq 2
      expect(table.dealer.length).to eq 2
      expect(table.deck.length).to eq 48
    end
  end
  describe "#blackjack?" do
    it "determines if the hand is blackjack" do
      table.blackjack? deck.player
    end
  end
  describe "#player_draw_card" do
    it "deals the player another card if their hand is less than 17" do

        p table.player
        table.player_draw_card
        p table.player
    end
  end
end
