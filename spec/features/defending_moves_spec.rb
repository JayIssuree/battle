describe "defending moves", type: :feature do
    
    it "displays a list of defending moves" do    
        sign_in_and_play
        expect(page).to have_button "Heal"
    end

    it "confirms the move has been made" do
        sign_in_and_play
        click_button "Heal"
        expect(page).to have_content("Player 1 used Heal")
    end

    it "heals the current player" do
        sign_in_and_play
        allow(Heal).to receive(:hit?).and_return(true)
        click_button "Heal"
        click_button "Return"
        expect(page).not_to have_content("Player 1 HP:100")
    end

end