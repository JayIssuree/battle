describe "attacking", type: :feature do

    it "confirms an attack has been made" do
        sign_in_and_play
        click_button "Attack!"
        expect(page).to have_content("Player 1 attacked Player 2")
    end

    it "reduces the hp of player 2" do
        sign_in_and_play
        click_button "Attack!"
        click_button "Return"
        expect(page).to have_content('Player 1: 100 HP')
        expect(page).to have_content('Player 2: 80 HP')
    end

end