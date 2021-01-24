class UserProfile < ApplicationRecord
  belongs_to :user

  validates :job, length: { maximum: 20 }
  validates :message, length: { maximum: 144 }
  validates :age, numericality: { only_integer: true, less_than: 150, allow_blank: true }
  # validates :total_assets, numericality: { only_integer: true, less_than: 99_999_999_999, allow_blank: true }
  # validates :annual_income, numericality: { only_integer: true, greater_than: 0, less_than: 999_999_999, allow_blank: true }
  # validates :monthly_income, numericality: { only_integer: true, greater_than: 0, less_than: 999_999_999, allow_blank: true }

  enum household_member: {
    single: 1,
    dinks: 2,
    with1kid: 3,
    with2kids: 4,
    with3kids: 5,
    with4kids: 6,
    withparent: 7,
    other: 8
  }

  enum total_assets: {
    t1: 1,
    t2: 2,
    t3: 3,
    t4: 4,
    t5: 5,
    t6: 6,
    t7: 7,
    t8: 8,
    t9: 9,
    t10: 10,
    t11: 11,
    t12: 12,
    t13: 13,
    t14: 14,
    t15: 15,
    t16: 16,
    t17: 17,
    t18: 18,
    t19: 19,
    t20: 20,
    t21: 21,
    t22: 22,
    t23: 23,
    t24: 24,
    t25: 25,
    t26: 26,
    t27: 27,
    t28: 28,
    t29: 29,
    t30: 30,
    t31: 31
  }

  enum annual_income: {
    a1: 1,
    a2: 2,
    a3: 3,
    a4: 4,
    a5: 5,
    a6: 6,
    a7: 7,
    a8: 8,
    a9: 9,
    a10: 10
  }
  enum monthly_income: {
    m1: 1,
    m2: 2,
    m3: 3,
    m4: 4,
    m5: 5,
    m6: 6,
    m7: 7,
    m8: 8,
    m9: 9,
    m10: 10,
    m11: 11,
    m12: 12,
    m13: 13,
    m14: 14,
    m15: 15,
    m16: 16,
    m17: 17,
    m18: 18,
    m19: 19,
    m20: 20
  }

  PREFECTURE_NAMES = %w[
    北海道
    青森県 岩手県 宮城県 秋田県 山形県 福島県
    茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県
    新潟県 富山県 石川県 福井県 山梨県 長野県 岐阜県 静岡県 愛知県
    三重県 滋賀県 京都府 大阪府 兵庫県 奈良県 和歌山県
    鳥取県 島根県 岡山県 広島県 山口県
    徳島県 香川県 愛媛県 高知県
    福岡県 佐賀県 長崎県 熊本県 大分県 宮崎県 鹿児島県
    沖縄県
    海外
  ].freeze
end
