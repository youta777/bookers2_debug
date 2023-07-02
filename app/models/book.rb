class Book < ApplicationRecord
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :comments,  dependent: :destroy

  validates :title, presence:true
  validates :body,  presence:true, length:{ maximum:200 }


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search_for(content, method)
    case method
    when "perfect" # 完全一致
      where(title: content)
    when "forward" # 前方一致
      where('title LIKE ?', content + '%')
    when "backward" # 後方一致
      where('title LIKE ?', '%' + content)
    when "partial" # 部分一致
      where('title LIKE ?', '%' + content + '%')
    end
  end
end
