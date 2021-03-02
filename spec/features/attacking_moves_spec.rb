describe "attacking moves", type: :feature do

    it "displays a list of attacks" do
        sign_in_and_play
        expect(page).to have_button("HeavyAttack")
    end
    
end