class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :nickname, presence: true, length: { in: 1..16 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 8..16 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :role, presence: true

  enum role: { general: 0, admin: 1 }
end