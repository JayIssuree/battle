describe "status attacks", type: :feature do
    
    it "displays a list of attacks" do
        sign_in_and_play
        expect(page).to have_button("Paralyze")
    end

    it "disables the option to attack if the player is paralyzed" do
        sign_in_and_play
        allow(Paralyze).to receive(:hit?).and_return(true)
        click_button("Paralyze")
        click_button("Return")
        expect(page).to have_content("Player 2 is paralyzed")
        expect(page).to_not have_button("LightAttack")
        expect(page).to_not have_button("HeavyAttack")
        expect(page).to_not have_button("MediumAttack")
        expect(page).to_not have_button("Paralyze")
    end

    it "skips the players turn if they are paralyzed" do
        sign_in_and_play
        allow(Paralyze).to receive(:hit?).and_return(true)
        click_button("Paralyze")
        click_button("Return")
        click_button("Next")
        expect(page).to have_content("Player 1's turn")
    end

    it "paralyzes them for 2 moves" do
        sign_in_and_play
        allow(Paralyze).to receive(:hit?).and_return(true)
        click_button("Paralyze")
        click_button("Return")
        click_button("Next")
        click_button("LightAttack")
        click_button("Return")
        click_button("Next")
        expect(page).to_not have_content("Player 2 is paralyzed")
    end

    it "damages the opponent when they are poisoned" do
        sign_in_and_play
        allow(Poison).to receive(:hit?).and_return(true)
        click_button("Poison")
        click_button("Return")
        expect(page).to_not have_content("Player 2: 100HP")
    end

end