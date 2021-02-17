describe "attacking", type: :feature do

    it "confirms an attack has been made" do
        sign_in_and_play
        click_button "Attack!"
        expect(page).to have_content("Player 1 attacked Player 2")
    end

end