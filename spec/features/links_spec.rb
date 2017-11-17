describe 'Bookmark', :type => :feature do

  feature '#index' do
    scenario 'see list of web site links ' do
      Link.create(name: 'Makers', url: 'www.makers.co.uk')
      visit "/links"
      expect(page).to have_content('Makers')
    end
  end
end
