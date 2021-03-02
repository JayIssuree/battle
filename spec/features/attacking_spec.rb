describe "attacking", type: :feature do

    it "confirms an attack has been made" do
        sign_in_and_play
        click_button "HeavyAttack"
        expect(page).to have_content("Player 1 used HeavyAttack on Player 2")
    end

    it "reduces the hp of player 2" do
        sign_in_and_play
        allow(HeavyAttack).to receive(:hit?).and_return(true)
        click_button "HeavyAttack"
        click_button "Return"
        expect(page).to have_content('Player 1: 100 HP')
        expect(page).not_to have_content('Player 2: 100 HP')
    end

    it "confirms player 2's attack" do
        sign_in_and_play
        web_attack
        click_button "HeavyAttack"
        expect(page).to have_content("Player 2 used HeavyAttack on Player 1")
    end

end