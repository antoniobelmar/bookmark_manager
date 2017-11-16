def destroy_last_entry
  Link.last.destroy
end

def  fill_and_add_bookmark
  visit '/create_link'
  fill_in :link_name, with: 'Google'
  fill_in :link_url, with: 'www.google.co.uk'
  fill_in :link_tag, with: 'books'
  click_button 'Add Link'
end
