describe "wining", type: :feature do

    it "displays a lose message when a player reaches 0 hp" do
        sign_in_and_play
        9.times { web_attack }
        expect(page).to have_content("Player 2 loses!")
    end

end