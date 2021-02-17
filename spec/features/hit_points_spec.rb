describe "viewing hitpoints", type: :feature do
    
    it "displays the hitpoints of the players" do
        visit('/')
        fill_in('player_1', with: 'Player 1')
        fill_in('player_2', with: 'Player 2')
        click_button('Submit')
        expect(page).to have_content('Player 1: 100 HP')
        expect(page).to have_content('Player 2: 100 HP')
    end

end