class Player

  attr_reader :name, :health_points, :poison_count
  attr_accessor :poisoned
  DEFAULT_HP = 100

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @health_points = hp
    @poisoned = false
    @poison_count = 0
  end

  def attack(player)
    player.receive_damage
  end

  def receive_damage
    @health_points = [@health_points - rand(0..15),0].max
  end

  def receive_force
    @health_points = [@health_points - rand(10..20),0].max
  end

  def heal_damage
    @health_points += rand(0..(100 - @health_points))
  end

  def receive_poison
    @health_points = [@health_points - rand(1..5),0].max
    @poison_count -= 1 if @poison_count > 0
  end

  def set_poisoned
    @poisoned = true
    @poison_count = rand(2..5)
    receive_poison
  end

  def poisoned?
    @poisoned
  end

  def check_poisoned_player
    receive_poison if @poison_count > 0 && poisoned?
    unset_poisoned if @poison_count == 0 && poisoned?
  end

  private

  def unset_poisoned
    @poisoned = false
  end

end
