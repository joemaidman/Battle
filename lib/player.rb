class Player

  attr_reader :name, :health_points
  attr_accessor :poisoned
  DEFAULT_HP = 100

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @health_points = hp
    @poisoned = false
  end

  def attack(player)
    player.receive_damage
  end

  def receive_damage
    @health_points -= rand(0..15)
  end

  def heal_damage
    @health_points += rand(0..15)
  end

  def receive_poison
    @health_points -= rand(0..5)
  end

  def poisoned?
    @poisoned
  end

end
