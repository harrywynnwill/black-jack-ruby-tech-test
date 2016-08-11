require './lib/table.rb'
table = Table.new
table.make_deck
table.shuffle_cards
table.deal_two_cards
table.dealer
table.player
table.player_hit_card
