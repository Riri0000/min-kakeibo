module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'みんなの家計簿'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}".to_s
  end

  # 表示する数字は3桁で(',')区切り、円をつける。
  def number_to_currency(price)
    if price.present?
      "#{number_with_delimiter(price, delimiter: ',')}円"
    else
      'ー'
    end
  end

  # プロフィールが無記入の場合の表示
  def show_value(object)
    object.presence || 'ー'
  end

  # 支出項目甩アイコン
  def show_icon(expense_item)
    case expense_item
    when '投資'
      'coins'
    when '貯金'
      'piggy-bank'
    when '住居費'
      'home'
    when '食費'
      'utensils'
    when '日用品費'
      'toilet-paper'
    when '水道光熱費'
      'hand-holding-water'
    when '通信費'
      'phone-square-alt'
    when '交通費'
      'train'
    when '医療費'
      'briefcase-medical'
    when '保険料'
      'hospital-user'
    when '社会保険料'
      'book-medical'
    when '教育費'
      'school'
    when '交際費'
      'glass-martini-alt'
    when '美容費'
      'hand-sparkles'
    when '衣服費'
      'tshirt'
    when '娯楽費'
      'umbrella-beach'
    when '特別費'
      'crown'
    when '雑費'
      'star-of-life'
    when 'その他'
      'paw'
    end
  end
end
