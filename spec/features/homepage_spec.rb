describe "the homepage", type: :feature do
    
    it "contains a welcome message" do
        visit('/')
        expect(page).to have_content 'Hello Battle!'
    end

end