module ApplicationHelper
  include Pagy::Frontend
  
  # 表示する数字は3桁で(',')区切り、円をつける。
  def number_to_currency(price)
    if price.present?
      "#{price.to_s(:delimited, delimiter: ',')}円"
    else
      'ー'
    end
  end

  def show_value(object)
    object.presence || 'ー'
  end
end
