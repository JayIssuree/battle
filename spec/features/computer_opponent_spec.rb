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
        expect(page).to have_button("Computer's turn")
    end

    it "allows the computer to use attacking moves" do
        visit('/')
        fill_in('player_1', with: 'Player 1')
        click_button('Submit')
        click_button('HeavyAttack')
        click_button('Return')
        allow_any_instance_of(Computer).to receive(:random_move).and_return(HeavyAttack)
        click_button("Computer's turn")
        expect(page).to have_content('Computer used HeavyAttack on Player 1')
    end

    it "allows the computer to use defensive moves" do
        visit('/')
        fill_in('player_1', with: 'Player 1')
        click_button('Submit')
        click_button('HeavyAttack')
        click_button('Return')
        allow_any_instance_of(Computer).to receive(:random_move).and_return(Heal)
        click_button("Computer's turn")
        expect(page).to have_content('Computer used Heal')
    end

end