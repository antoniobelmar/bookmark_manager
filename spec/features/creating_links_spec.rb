 # Capybara.app = Bookmark
  feature 'creating links' do
    scenario 'user can input a new link' do
      visit '/create_link'
      expect(page).to have_field('link_name')
      expect(page).to have_field('link_url')
      expect(page).to have_selector('input', id: 'save')
    end

    scenario 'link is added' do
      fill_and_add_bookmark
      expect(page).to have_content('Google')
    end

    scenario 'user can tag a link' do
      fill_and_add_bookmark
      expect(page).to have_content('books')
    end


end
