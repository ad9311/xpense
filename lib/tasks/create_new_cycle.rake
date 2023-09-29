namespace :cycle do
  desc 'Create a new cycle'
  task create_new: :environment do
    current_date = { month: DateTime.now.month, year: DateTime.now.year }
    User.all.each do |u|
      u.cycles.create(current_date) if u.cycles.find_by(current_date).nil?
    end
  end
end
