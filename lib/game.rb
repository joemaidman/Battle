class Game

  attr_reader :current_player, :opponent, :poison_count, :forced_player

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = @players[rand(0..1)]
    @poison_count = 0
    @forced_player = @current_player
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(attacked_player)
    attacked_player.receive_damage
  end

  def sleepy
    @sleepy = true
  end

  def poison(poisoned_player)
    poisoned_player.set_poisoned
  end

  def force
    @forced_player = @players[rand(0..1)]
    @forced_player.receive_force
  end

  def heal(healed_player)
    healed_player.heal_damage
  end

  def change_player
    @current_player = opponent_of(current_player)
    check_missed_turn
    @players.each { |player| player.check_poisoned_player }
  end

  def opponent_of(curr_player)
    @players.select { |player| player != curr_player}.first
  end

  def loser
    @players.select { |player| player.health_points <= 0}.first
  end

  def game_over?
    loser ? true : false
  end

  private

  def check_missed_turn
    @current_player = opponent_of(current_player) if @sleepy == true
    @sleepy = false
  end

end
