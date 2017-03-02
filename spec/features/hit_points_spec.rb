feature "Player 1 wants to see Player 2's HP", :type => :feature do

  p1_name = "Joe"
  p2_name = "Alice"

  describe "so they enter names on the '/' route and are sent to /play route which" do
    before do
      sign_in_and_play(p1_name, p2_name)
    end

    it "shows player two's HP" do
      expect(page.find_by_id("p2_hp")).to have_content("P2 HP: 100")
    end

  end

end
