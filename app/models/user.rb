class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
          :recoverable, :rememberable, :validatable

  has_many :books,     dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_many :active_relationships,  class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follow_id',   dependent: :destroy
  has_many :follows,   through: :active_relationships, source: :follow
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :user_rooms
  has_many :chats
  has_many :rooms,     through: :user_rooms
  has_many :view_counts, dependent: :destroy

  has_one_attached :profile_image

  validates :name,         length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def favorited_by?(user)
    favites.exists?(user_id: user.id)
  end

  def follow(user)
    self.follows << user
  end

  def unfollow(user)
    self.follows.destroy(user)
  end

  def following?(user)
    self.follows.include?(user)
  end

  def self.search_for(content, method)
    case method
    when "perfect" # 完全一致
      where(name: content)
    when "forward" # 前方一致
      where('title LIKE ?', content + '%')
    when "backward" # 後方一致
      where('title LIKE ?', '%' + content)
    when "partial" # 部分一致
      where('title LIKE ?', '%' + content + '%')
    end
  end
end
