require 'game'

describe Game do
  let(:player_1) {double(:player_1)}
  let(:player_2) {double(:player_2)}
  
  subject(:game) {described_class.new(player_1, player_2)}

   it 'can call attack on player' do
     expect(game).to respond_to(:attack)
   end

   it 'can change the current player' do
     expect(game).to respond_to(:change_player)
   end

   it 'change_player changes the current player' do
     expect{game.change_player}.to change{game.current_player}.to player_2
     expect{game.change_player}.to change{game.current_player}.to player_1
   end

   it 'change_player changes the opponent player' do
     expect{game.change_player}.to change{game.opponent}.to player_1
     expect{game.change_player}.to change{game.opponent}.to player_2
   end

end
