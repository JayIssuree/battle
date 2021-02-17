describe "viewing hitpoints", type: :feature do
    
    it "displays the hitpoints of the players" do
        sign_in_and_play
        expect(page).to have_content('Player 1: 100 HP')
        expect(page).to have_content('Player 2: 100 HP')
    end

end