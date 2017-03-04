require 'spec_helper'
feature 'A new game' do

  before(:all) do
    srand(67809)
  end

  p1_name = "Joe"
  p2_name = "Alice"

  before do
    sign_in_and_play(p1_name, p2_name)
  end

  feature "Players want to start a game", :type => :feature do

    describe "so they enter names on the '/' route and are sent to /play route which" do

      it "shows players names" do
        expect(page).to have_text("#{p1_name} VS #{p2_name}")
      end

    end

  end

  feature 'winning & losing' do
    describe "when a player reaches 0 HP" do
      before do
        sign_in_and_play(p1_name, p2_name)
        19.times {
           click_button("Attack")
           click_button("Next Turn")
        }
      end

      it "tells the losing player they have lost and the winning player they won" do
        expect(page).to have_text("#{p1_name} won!! Sorry #{p2_name} you lost!!")
      end

    end
  end

  feature "Show player health points", :type => :feature do
    describe "so they enter names on the '/' route and are sent to /play route which" do
      before do
        sign_in_and_play(p1_name, p2_name)
      end

      it "shows player one's HP" do
        expect(page.find_by_id("p1_hp")).to have_content(p1_name +" HP: 100")
      end

      it "shows player two's HP" do
        expect(page.find_by_id("p2_hp")).to have_content(p2_name +" HP: 100")
      end
    end
  end

  feature "Attacking", :type => :feature do

    describe "player 1 attacks player 2" do
      before do
        sign_in_and_play(p1_name, p2_name)
      end

      it 'shows whose turn it is' do
        expect(page).to have_content("#{p2_name}, you're up")
      end

      it 'swtiches players after a turn' do
        within "#actions" do
          click_button("Attack")
        end
        click_button('Next Turn')
        expect(page).to have_content("#{p1_name}, you're up")
      end

      it "the attack is confirmed" do
        within "#actions" do
          click_button("Attack")
        end
        expect(page).to have_content("#{p2_name} attacked #{p1_name}")
      end

      it "and the attacked player's HP is reduced" do
        within "#actions" do
          click_button("Attack")
        end

        click_button("Next Turn")
        expect(page.find_by_id("p1_hp")).to have_content(p1_name + " HP: 100")
        expect(page.find_by_id("p2_hp")).to have_content(p2_name + " HP: 90")
      end

      it 'player 2 has an attack confirmed' do
        within "#actions" do
          click_button("Attack")
        end

        click_button('Next Turn')
        click_button("Attack")
        expect(page).to have_content("#{p1_name} attacked #{p2_name}")
      end

    end

  end

end
