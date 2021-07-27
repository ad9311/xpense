require 'rails_helper'

Rails.describe Expense, type: :feature do
  Capybara.current_session.instance_variable_set(:@touched, false)
  before :each do
    User.create(name: 'Ángel', email: 'angel@mail.com', password: '123456', password_confirmation: '123456')
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
  end

  it 'adds many expnses to a folder' do
    20.times do |n|
      Expense.create(author_id: User.last.id, name: "Expense-##{n}", amount: n, description: "Expense-##{n}")
      id = Expense.last.id
      GroupedExpense.create(group_id: Group.last.id, expense_id: id)
    end
    expect(GroupedExpense.all.length).to eq(20)
  end
end
