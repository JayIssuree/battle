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

    it "confirms player 2's attack" do
        sign_in_and_play
        web_attack
        click_button "Attack!"
        expect(page).to have_content("Player 2 attacked Player 1")
    end

end