class Game

  attr_reader :current_player, :opponent, :poison_count

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = @players[rand(0..1)]
    @poison_count = 0
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
    poisoned_player.poisoned = true
    @poison_count = rand(1..3)
  end

  def heal(healed_player)
    healed_player.heal_damage
  end

  def change_player
    @current_player = opponent_of(current_player)
    check_missed_turn
    check_poisoned_player
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

  def check_poisoned_player
    @players.each{ |player| unset_poisoned(player) if @poison_count == 0 && @player}
    @poisoned_player.receive_poison if @poison_count > 0 && @poisoned_player
    @poison_count -= 1 if @poison_count > 0
  end

  def unset_poisoned(player)
    player.poisoned = false
  end

end
