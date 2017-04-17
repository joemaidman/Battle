require 'player'

describe Player do

  before(:all) do
    srand(67809)
  end

  name = "Joe"
  let(:player) {described_class.new(name)}

  it 'can return the correct name' do
    expect(player.name).to eq name
  end

  it 'initially has HP equal to the default HP' do
    expect(player.health_points).to eq described_class::DEFAULT_HP
  end

  it 'HP is reduced by 10 when receiving damage' do
    expect{player.receive_damage}.to change {player.health_points}.by(-2)
  end

end
