require 'rails_helper'

Rails.describe Expense, type: :feature do
  Capybara.current_session.instance_variable_set(:@touched, false)
  before :each do
    User.create(name: 'Ángel', email: 'angel@mail.com', password: '123456', password_confirmation: '123456')
    Expense.create(author_id: User.last.id, name: 'Apples', amount: 2.99, description: 'Supermarket')
    Group.create(user_id: User.last.id, name: 'Food', icon: 'food.png')
  end

  it 'confirms user have been previously created' do
    expect(User.last.name).to have_content 'Ángel'
  end

  before 'signs user in for the rest of the tests' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'angel@mail.com'
      fill_in 'user_password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'tries to add a new expense' do
    visit '/home'
    click_link(id: 'expenses')
    click_link('New Expense')
    click_button 'Submit'
    expect(page).to have_content 'Description is too short (minimum is 6 characters)'
  end

  it 'tries to add a new expense' do
    visit '/home'
    click_link(id: 'expenses')
    click_link('New Expense')
    click_button 'Submit'
    expect(page).to have_content "Name can't be blank"
  end

  it 'tries to add a new expense' do
    visit '/home'
    click_link(id: 'expenses')
    click_link('New Expense')
    click_button 'Submit'
    expect(page).to have_content 'Amount is not a number'
  end

  it 'creates a new expense and checks for it in user\'s expenses' do
    visit '/home'
    click_link(id: 'expenses')
    click_link('New Expense')
    fill_in 'expense_name', with: 'Bananas'
    fill_in 'expense_amount', with: '12.5'
    fill_in 'expense_description', with: 'Bought in wallmart'
    click_button 'Submit'
    expect(User.last.expenses.last.name).to have_content 'Bananas'
  end

  it 'deletes an expense' do
    visit '/home'
    click_link(id: 'external_expenses')
    click_link('Show')
    click_link('Delete')
    expect(page).to have_content 'Expense deleted'
  end

  it 'add an expense to a folder' do
    visit '/external_expenses'
    click_link('Show')
    click_link("Add To #{Group.last.name}")
    expect(Group.last.expenses.last.name).to have_content 'Apple'
  end

  it 'adds many expenses to check correct addition of amount' do
    20.times do |n|
      Expense.create(author_id: User.last.id, name: "Expense-##{n}", amount: n, description: 'many expenses')
    end
    expect(User.last.expenses.sum(:amount)).to eq(192.99)
  end

  it 'checks folders where an expense is not present' do
    20.times do |n|
      Group.create(user_id: User.last.id, name: "Misc-##{n}", icon: 'other.png')
    end
    expect(Expense.last.not_in_group.length).to eq(21)
  end
end
