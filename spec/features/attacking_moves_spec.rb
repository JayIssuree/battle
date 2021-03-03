describe "attacking moves", type: :feature do

    it "displays a list of attacks" do
        sign_in_and_play
        expect(page).to have_button("HeavyAttack")
    end

    it "displays a list of attacks" do
        sign_in_and_play
        expect(page).to have_button("LightAttack")
    end

    it "displays a list of attacks" do
        sign_in_and_play
        expect(page).to have_button("MediumAttack")
    end
    
end