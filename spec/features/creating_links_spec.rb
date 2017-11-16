
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

  feature 'filtering by tag' do
    scenario 'visit links/bubbles and see all links tagged with bubbles' do
      visit '/create_link'
      fill_in :link_name, with: 'bubbles'
      fill_in :link_url, with: 'www.bubbles.com'
      fill_in :link_tag, with: 'bubbles'
      click_button 'Add Link'
      visit '/tags/bubbles'
      expect(page).to have_content('bubbles')
    end
  end

  feature 'filtering by tag' do
    scenario 'visit links/bubbles and not see links tagged with books' do
      fill_and_add_bookmark
      visit '/tags/bubbles'
      expect(page).to_not have_content('books')
    end
  end

  feature 'adds multiple tags' do
    scenario 'shows multiple tags' do
      visit '/create_link'
      fill_in :link_name, with: 'bubbles'
      fill_in :link_url, with: 'www.bubbles.com'
      fill_in :link_tag, with: 'bubbles,apples'
      click_button 'Add Link'
      link = Link.last
      expect(link.tags.map {|tag| tag.name }).to include('bubbles')
      expect(link.tags.map {|tag| tag.name }).to include('apples')
    end
  end

end
