class Game
  attr_reader :player_1, :player_2, :current_player, :opponent

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @players = [@player_1, @player_2]
    @current_player = player_1
  end

  def attack(attacked_player)
    attacked_player.receive_damage
  end

  def change_player
    @current_player = opponent_of(current_player)
  end

  private

  def opponent_of(curr_player)
    @players.select { |player| player != curr_player}.first
  end

end
