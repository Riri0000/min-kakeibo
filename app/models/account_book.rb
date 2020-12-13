class AccountBook < ApplicationRecord
  belongs_to :user
  has_many :expenses
  
  validates :date, presence: true
end
