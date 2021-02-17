describe "entering names", type: :feature do

    it "contains a form fo player to enter their names" do
        visit('/')
        expect(page).to have_field('player_1')
        expect(page).to have_field('player_2')
    end
    
    it "displays the entered names" do
        visit('/')
        fill_in('player_1', with: 'Player 1')
        fill_in('player_2', with: 'Player 2')
        click_button('Submit')
        expect(page).to have_content('Player 1 vs Player 2')
    end

end