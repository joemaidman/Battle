require_relative "../../app"

feature "Players can enter their names", :type => :feature do
  p1_name = "Joe"
  p2_name = "Alice"
  scenario "Player enters their name" do
    visit "/"
    fill_in "name_player_one", :with => p1_name
    fill_in "name_player_two", :with => p2_name
    click_button('submit')
    expect(page).to have_text("This is #{p1_name} V #{p2_name}. Prepare to fight!")
    expect(page).to have_content 'P2 HP: 100'
  end

end
