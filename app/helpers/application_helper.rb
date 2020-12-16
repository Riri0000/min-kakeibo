module ApplicationHelper
  # 表示する数字は3桁で(',')区切り、円をつける。
  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end
end
