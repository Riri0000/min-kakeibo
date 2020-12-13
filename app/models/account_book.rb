class AccountBook < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
end
