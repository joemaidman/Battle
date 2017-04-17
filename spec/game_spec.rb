require 'game'

describe Game do
  let(:player_1) {double :player_1, check_poisoned_player: false}
  let(:player_2) {double :player_2 , check_poisoned_player: false}

  before(:all) do
    srand(67809)
  end

  subject(:game) {described_class.new(player_1, player_2)}

   it 'can call attack on player' do
     expect(game).to respond_to(:attack)
   end

   it 'can change the current player' do
     expect(game).to respond_to(:change_player)
   end

   it 'change_player changes the current player' do
     expect{game.change_player}.to change{game.current_player}.to player_1
     expect{game.change_player}.to change{game.current_player}.to player_2
   end

   it 'gets the opponent of the current player' do
     expect(game.opponent_of(player_1)).to eq player_2
   end

   it 'sets the loser if a player has zero HP and sets the game to be over' do
     allow(player_1).to receive(:health_points) { 0 }
     allow(player_2).to receive(:health_points) { 10 }
     expect(game.loser).to eq player_1
     expect(game.game_over?).to eq true
   end


end
