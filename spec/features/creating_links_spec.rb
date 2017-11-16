
 # Capybara.app = Bookmark
  feature 'creating links' do
    scenario 'user can input a new link' do
      visit '/create_link'
      expect(page).to have_field('link_name')
      expect(page).to have_field('link_url')
      expect(page).to have_selector('input', id: 'save')
  end

      scenario 'link is added' do
        visit '/create_link'
        fill_in :link_name, with: 'Google'
        fill_in :link_url, with: 'www.google.co.uk'
        click_button 'Add Link'
        expect(page).to have_content('Google')
      end

      scenario 'user can tag a link' do
        visit '/create_link'
        fill_in :link_name, with: 'Google'
        fill_in :link_url, with: 'www.google.co.uk'
        fill_in :link_tag, with: 'books'
        click_button 'Add Link'
        expect(page).to have_content('books')
      end
end
