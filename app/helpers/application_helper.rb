module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'みんなの家計簿'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}".to_s
  end

  # 表示する数字は3桁で(',')区切り、円をつける。
  def number_to_currency(price)
    if price.present?
      "#{price.to_s(:delimited, delimiter: ',')}円"
    else
      'ー'
    end
  end

  # プロフィールが無記入の場合の表示
  def show_value(object)
    object.presence || 'ー'
  end
end
