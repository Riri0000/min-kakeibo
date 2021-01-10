class User < ApplicationRecord
  # httpでネットワーク上のリソースを取得
  require 'open-uri'

  # twiiter画像をオリジナルサイズに加工
  before_save { self.profile_image = profile_image&.gsub('_normal', '') }

  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_one :account_book, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_account_books, through: :likes, source: :account_book
  has_one_attached :avator
  accepts_nested_attributes_for :authentications

  validates :nickname, presence: true, length: { in: 1..16 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 8..30 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :role, presence: true

  enum role: { general: 0, admin: 1, guest: 2 }

  def own?(object)
    id == object.user_id
  end

  def like(account_book)
    like_account_books << account_book
  end

  def dislike(account_book)
    like_account_books.destroy(account_book)
  end

  # N+1対策で、user起点にする。
  def like?(account_book)
    account_book.likes.pluck(:user_id).include?(id)
  end

  # twitter画像をActiveStrageへ保存
  def download_and_attach_profile_image(profile_image)
    return unless profile_image

    file = URI.open(profile_image)
    binding.pry
    self.avator.attach(io: file,
                       filename: "profile_image.#{file.content_type_parse.first.split("/").last}",
                       content_type: file.content_type_parse.first)
  end
end
