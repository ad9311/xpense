namespace :cycle do
  desc 'Create a new cycle'
  task create_new: :environment do
    current_date = { month: DateTime.now.month, year: DateTime.now.year }
    User.find_each do |user|
      next unless user.cycles.find_by(current_date)

      cycle = user.cycles.build(current_date)
      if cycle.save
        user.fixed_transactions.each do |ft|
          Income.create(description: ft.description, amount: ft.amount, cycle:) if ft.income?
          Expense.create(description: ft.description, amount: ft.amount, cycle:) if ft.expense?
        end
      end
    end
  end
end
