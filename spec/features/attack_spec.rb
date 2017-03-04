
feature "Attacking", :type => :feature do

  p1_name = "Joe"
  p2_name = "Alice"

  describe "player 1 attacks player 2" do
    before do
      sign_in_and_play(p1_name, p2_name)
    end

    it 'shows whose turn it is' do
      expect(page).to have_content("Joe, you're up")
    end

    it "the attack is confirmed" do
      within "#actions" do
        click_button("Attack")
      end
        expect(page).to have_content("Joe attacked Alice")
    end

    it "and the attacked player's HP is reduced" do
      within "#actions" do
        click_button("Attack")

      end
      click_button("Next Turn")
      expect(page.find_by_id("p1_hp")).to have_content(p1_name + " HP: 100")
      expect(page.find_by_id("p2_hp")).to have_content(p2_name + " HP: 90")
    end

    it 'swtiches players after a turn' do
      within "#actions" do
        click_button("Attack")

      end
      click_button('Next Turn')
      expect(page).to have_content("Alice, you're up")
    end

  end

end
