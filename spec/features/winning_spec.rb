describe "wining", type: :feature do

    it "displays a lose message when a player reaches 0 hp" do
        sign_in_and_play
        click_button "HeavyAttack"
        allow(Game.current_game).to receive(:finished?).and_return(:true)
        allow(Game.current_game).to receive(:loser).and_return(Game.current_game.player2)
        click_button "Return"
        expect(page).to have_content("Player 2 loses!")
    end

end