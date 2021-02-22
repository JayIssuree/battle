describe "changing turns", type: :feature do

    it "displays the current players turn" do
        sign_in_and_play
        expect(page).to have_content("Player 1's turn")
    end

    it "displays the next players turn after player 1 attacks" do
        sign_in_and_play
        web_attack
        expect(page).to have_content("Player 2's turn")
    end

end