class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :follow,   class_name: "User"

  validates :follow_id,   presence: true
  validates :follower_id, presence: true, uniqueness: { scope: :follow_id }
end
