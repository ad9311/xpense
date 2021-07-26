require 'rails_helper'

Rails.describe Expense, type: :feature do
  Capybara.current_session.instance_variable_set(:@touched, false)
  before :each do
    User.create(name: 'Ángel', email: 'angel@mail.com', password: '123456', password_confirmation: '123456')
    Group.create(user_id: User.last.id, name: 'Food', icon: 'food.png')
    Expense.create(author_id: User.last.id, name: 'Apples', amount: 2.99, description: 'Supermarket')
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
  end

  it 'trys to create a new group' do
    visit '/home'
    click_link(id: 'folders')
    click_link('New Folder')
    click_button 'Submit'
    expect(page).to have_content "Name can't be blank"
  end

  it 'trys to create a new group' do
    visit '/home'
    click_link(id: 'folders')
    click_link('New Folder')
    fill_in 'group_name', with: 'Steam'
    click_button 'Submit'
    expect(page).to have_content 'Icon must be selected'
  end

  it 'deletes an expense' do
    visit '/home'
    click_link(id: 'folders')
    click_link('Show')
    click_link('Delete')
    expect(page).to have_content 'Folder deleted'
  end

  before 'saves an expense to a folder' do
    GroupedExpense.create(group_id: Group.last.id, expense_id: Expense.last.id)
  end

  it 'confirms previous grouped_expense has been created' do
    expect(GroupedExpense.last.group_id).to eq(Group.last.id)
  end

  it 'checks expense\'s author name in group\'s expenses list' do
    visit '/folders'
    click_link('Show')
    expect(page).to have_content User.last.name.to_s
  end

  it 'checks how many expenses a group has' do
    20.times do |n|
      Expense.create(author_id: User.last.id, name: "Expense-##{n}", amount: n, description: "Expense-##{n}")
      id = Expense.last.id
      GroupedExpense.create(group_id: Group.last.id, expense_id: id)
    end
    expect(Group.last.number_of_expenses).to eq(21)
  end
end
