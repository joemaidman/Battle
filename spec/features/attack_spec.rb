feature "Attacking", :type => :feature do

  p1_name = "Joe"
  p2_name = "Alice"

  describe "player 1 attacks player 2" do
    before do
      sign_in_and_play(p1_name, p2_name)
    end

    it "the attack is confirmed" do
      within "#p1_actions" do
        click_button("Attack")
      end
        expect(page.find_by_id("last_action")).to have_content("Joe attacked Alice")
    end
  end

end
