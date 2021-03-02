describe "computer opponent", type: :feature do
    
    it "creates a computer opponent " do
        visit('/')
        click_button('Submit')
        expect(page).to have_content('Computer vs Computer')
    end

    it "changes the button to receive incoming attack when the current turn is the computer" do
        visit('/')
        fill_in('player_1', with: 'Player 1')
        click_button('Submit')
        click_button('HeavyAttack')
        click_button('Return')
        expect(page).to have_button('Receive incoming attack')
    end

end