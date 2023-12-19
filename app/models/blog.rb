class Blog < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :tweets

	mount_uploader :image, ProfileImageUploader

	validates :title, presence: true, length: { maximum: 30 }
	validates :body, presence: true, length: { maximum: 1000 }

  def favorited_by?(user)
     favorites.where(user_id: user.id).exists?
  end

end
