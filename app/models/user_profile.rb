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
    t_1: 1,
    t_2: 2,
    t_3: 3,
    t_4: 4,
    t_5: 5,
    t_6: 6,
    t_7: 7,
    t_8: 8,
    t_9: 9,
    t_10: 10,
    t_11: 11,
    t_12: 12,
    t_13: 13,
    t_14: 14,
    t_15: 15,
    t_16: 16,
    t_17: 17,
    t_18: 18,
    t_19: 19,
    t_20: 20,
    t_21: 21,
    t_22: 22,
    t_23: 23,
    t_24: 24,
    t_25: 25,
    t_26: 26,
    t_27: 27,
    t_28: 28,
    t_29: 29,
    t_30: 30,
    t_31: 31
  }

  enum annual_income: {
    a_1: 1,
    a_2: 2,
    a_3: 3,
    a_4: 4,
    a_5: 5,
    a_6: 6,
    a_7: 7,
    a_8: 8,
    a_9: 9,
    a_10: 10
  }
  enum monthly_income: {
    m_1: 1,
    m_2: 2,
    m_3: 3,
    m_4: 4,
    m_5: 5,
    m_6: 6,
    m_7: 7,
    m_8: 8,
    m_9: 9,
    m_10: 10,
    m_11: 11,
    m_12: 12,
    m_13: 13,
    m_14: 14,
    m_15: 15,
    m_16: 16,
    m_17: 17,
    m_18: 18,
    m_19: 19,
    m_20: 20
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
