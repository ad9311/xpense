class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  belongs_to :user
end
