class Icon < ApplicationRecord
  scope :ordered_alphabetically, -> { order(name: :asc) }
end
