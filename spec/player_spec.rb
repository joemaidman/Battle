require 'player'

describe Player do
  name = "Joe"
  let(:player) {described_class.new(name)}

  it 'can return the correct name' do
    expect(player.name).to eq name
  end

end
