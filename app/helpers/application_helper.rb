module ApplicationHelper
  def default_meta_tags
    {
      site: 'みんなの家計簿',
      title: '',
      description: 'みんなの家計簿は、家計簿公開サービスです。あなたの家計簿を公開、みんなの家計簿を見れちゃいます。お金と向き合うきっかけに。',
      charset: 'utf-8',
      keywords: '家計簿 家計簿公開 みんなの家計簿 家計簿のぞき見 資産公開',
      separator: '|',
      reverse: true,
      icon: [
        { href: asset_pack_url('media/images/kakeibo_cat.png'), sizes: '32x32 96x96', type: 'image/png' },
        { href: asset_pack_url('media/images/logo-no-border.png'), rel: 'apple-touch-icon-precomposed', sizes: '32x32', type: 'image/png' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: :canonical,
        image: asset_pack_url('media/images/kakeibo_cat.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary',
        site: '@min_kakeibo',
        image: asset_pack_url('media/images/kakeibo_cat.png'),
        width: 100,
        height: 100
      }
    }
  end

  # 表示する数字は3桁で(',')区切り、末尾に円をつける。
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

  # 金額の漢数字表示
  def show_money(num)
    money = YaKansuji.to_kan(num, :lawyer)
    money == '0' ? 'ー' : "#{money}円"
  end

  # 支出項目用アイコン
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
