require_relative '../Cycles.rb'

namespace :cycle do
  desc 'Create a new cycle'
  task create_new: :environment do
    include Cycles
    next_users_cycles(User.all)
  end
end
