module ApplicationHelper
  def full_title(page_title = '')  # full_titleメソッドを定義
    base_title = 'Three-Style'
    if page_title.blank?
      base_title  # トップページはタイトル「Three-Style」
    else
      "#{page_title} - #{base_title}" # トップ以外のページはタイトル「利用規約 - Three-Style」（例）
    end
  end
end
