feature 'sign-up' do
  scenario 'sees a sign-up form asking for email at index page' do
    visit '/'
    expect(page).to have_content('Email')
  end
  scenario 'sees a sign-up form asking for password at index page' do
    visit '/'
    expect(page).to have_content('Password')
  end
  scenario 'sees a sign-up button at index page' do
    visit '/'
    expect(page).to have_button('sign-up')
  end
  scenario 'redirects to /links page after signing-up' do
    visit '/'
    fill_in :user_name, with: 'antonio@uniplaces.com'
    fill_in :password, with: 'password'
    click_button 'Sign-up'
    expect(page).to have_current_path('/links')
  end
  scenario 'ensures /links has welcome message' do
    visit '/'
    fill_in :user_name, with: 'antonio@uniplaces.com'
    fill_in :password, with: 'password'
    click_button 'Sign-up'
    expect(page).to have_content('Welcome')
  end
  scenario 'ensures that /links welcome message contains user email_address' do
    visit '/'
    fill_in :user_name, with: 'antonio@uniplaces.com'
    fill_in :password, with: 'password'
    click_button 'Sign-up'
    expect(page).to have_content('antonio@uniplaces.com')
  end
end
