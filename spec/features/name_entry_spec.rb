feature "Players want to start a game", :type => :feature do

  p1_name = "Joe"
  p2_name = "Alice"

  describe "so they enter names on the '/' route and are sent to /play route which" do
    before do
      sign_in_and_play(p1_name, p2_name)
    end

    it "shows players names" do
      expect(page).to have_text("#{p1_name} VS #{p2_name}")
    end

  end

end
