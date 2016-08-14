require 'Table'
describe Table do

  let(:table) {described_class.new}
  let(:card ) {double :card}
  let(:hand_11) {double :card , rank: "A", value:11}
  let(:hand_10) {double :card , rank: "K", value:10}
  let(:hand_7) {double :card , rank: "7", value:7}
  let(:hand_4) {double :card , rank: "4", value:4}
  let(:blackjack_hand) {[hand_11, hand_10]}
  let(:seventeen_hand) {[hand_10, hand_7]}
  let(:eleven_hand) { hand_7}

  describe "#make_deck" do
    it "builds a pack of cards of 52 with 4 suits and values" do
      table.make_deck
      expect(table.deck.length).to eq 52
      expect(table.deck).to include(a_kind_of(Card))
    end
  end

  describe "#dealer_hand_total" do
    it "determine score of dealers hand" do
      allow(table).to receive(:hand_totaller) {21}
      expect(table.dealer_hand_total).to eq 21
    end
  end

  describe "#player_hand_total" do
    it "determine score of players hand" do
      allow(table).to receive(:hand_totaller) {21}
      expect(table.player_hand_total).to eq 21
    end
  end

  describe "#blackjack?" do
    before(:each) do
      table.make_deck
      table.deal_two_cards
    end

    context "when the player has blackjack" do
      it "returns a message that the player has BJ" do
        allow(table).to receive(:player_hand_total){21}
        expect(table.blackjack?).to eq "Player has blackjack"
      end
    end
    context "when the player does not have blackjack" do
      it "returns nil" do
        allow(table).to receive(:player_hand_total){20}
        expect(table.blackjack?).to eq nil
      end
    end
    context "when the dealer had blackjack" do
      it "returns that the dealer has won" do
        allow(table).to receive(:dealer_hand_total){21}
        expect(table.blackjack?).to eq "Dealer has blackjack"
      end
    end
  end

  describe "#player_hit_card" do
    # before(:each) do
    #   table.make_deck
    #   table.deal_two_cards
    # end
    context "hand below 17" do
      it "gives the player another card" do
        allow(table).to receive_messages(:player => 2)
        p table.player
        p table.player_hand_total
        table.player_hit_card
        expect{ table.player_hit_card }.to change {table.player.length}.by(1)
        p.table.player.length
      end
    end
  end

  describe "#result_of_hand" do
    context "dealer has won" do
      it "returns that dealer has won the game" do
        allow(table).to receive(:dealer_hand_total){21}
        allow(table).to receive(:player_hand_total){20}
        expect(table.result_of_hand).to eq "Dealer wins"
      end
    end
    context "player has won" do
      it "returns that player has won the game" do
        allow(table).to receive(:player_hand_total){21}
        allow(table).to receive(:dealer_hand_total){20}
        expect(table.result_of_hand).to eq "Player wins"
      end
    end
  end


  xdescribe "#deal_two_cards" do
    it "deals 2 cards from the deck to the player and the dealer" do
      expect(table.player.length).to eq 2
      expect(table.dealer.length).to eq 2
      expect(table.deck.length).to eq 48
    end
  end

  xdescribe "#blackjack?" do
    it "determines if the hand is blackjack" do
      table.blackjack? table
    end
  end

  xdescribe "#player_draw_card" do
    it "deals the player another card if their hand is less than 17" do
        p table.player
        table.player_draw_card
        p table.player
    end
  end

end
