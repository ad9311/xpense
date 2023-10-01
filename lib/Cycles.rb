module Cycles
  def next_user_cycle(user)
    cycle = user.cycles.find_by(current_date)
    cycle = Cycle.new(**current_date, user:) if cycle.nil?
    Rails.logger.debug { "Create cycle for #{user.email} user" } if cycle.save
  end

  def next_users_cycles(users)
    users.find_each do |user|
      next_user_cycle(user)
    end
  end

  private

  def current_date
    { month: DateTime.now.month, year: DateTime.now.year }
  end
end
