class AccountBook < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :expenses, reject_if: :all_blank, allow_destroy: true

  validates :date, presence: true
end
