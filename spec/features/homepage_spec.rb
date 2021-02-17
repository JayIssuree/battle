feature "the homepage" do
    
    scenario "contains a welcome message" do
        visit('/')
        expect(page).to have_content 'Battle!'
    end

end