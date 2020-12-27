class AccountBook < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :expenses, reject_if: :all_blank, allow_destroy: true

  validates :date, presence: true

  # 検索用
  scope :sort_by_likes, -> { find(Like.group(:account_book_id).order('count(account_book_id) DESC').pluck(:account_book_id)) }

  def self.ransackable_scopes(_auth_object = nil)
    %i[sort_by_likes]
  end
end
