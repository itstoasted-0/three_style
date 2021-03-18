class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :genre, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  enum genre: {
    others: 0,
    surf: 1,
    skate: 2,
    snow: 3
  }

  # 投稿に付属するコメントのフィードを作成
  def feed_comment(post_id)
    Comment.where("post_id = ?", post_id)
  end

  private

    # アップロードされた画像のサイズを制限する
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "：5MBより大きい画像はアップロードできません。")
      end
    end
    
end
