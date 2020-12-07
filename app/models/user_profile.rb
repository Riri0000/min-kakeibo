class UserProfile < ApplicationRecord
  belongs_to :user

  validates :job, length: { maximum: 20 }
  validates :message, length: { maximum: 144 }
end
