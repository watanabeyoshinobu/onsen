class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 1000 }
end
