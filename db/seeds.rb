# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Icon.create(name: 'House', icon: 'house.png')
# Icon.create(name: 'Work', icon: 'work.png')
# Icon.create(name: 'Study', icon: 'study.png')
# Icon.create(name: 'Shopping', icon: 'shopping.png')
# Icon.create(name: 'Food', icon: 'food.png')
# Icon.create(name: 'Pharma', icon: 'pharma.png')
# Icon.create(name: 'Video Games', icon: 'video_games.png')
# Icon.create(name: 'Sports', icon: 'sports.png')
# Icon.create(name: 'Other', icon: 'other.png')

(1..20).each do |n|
  #GroupedExpense.create(group_id: 4, expense_id: grouped_expense)
  Group.create(user_id: 1, name: "Folder ##{n}", icon: 'food.png')
end
