require 'rails_helper'

Rails.describe User, type: :feature do
  before :each do
    User.create(name: 'Ángel', email: 'angel@mail.com', password: '123456', password_confirmation: '123456')
  end

  it 'confirms user have been previously created' do
    expect(User.last.name).to have_content 'Ángel'
  end

  it 'signs user in' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'angel@mail.com'
      fill_in 'user_password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    page.instance_variable_set(:@touched, false)
  end

  it 'signs user out' do
    click_link('Sign Out')
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  it 'creates a new user' do
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_name', with: 'Carlos'
      fill_in 'user_email', with: 'carlos@mail.com'
      fill_in 'user_password', with: '1234567'
      fill_in 'user_password_confirmation', with: '1234567'
    end
    click_button 'Sign Up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
