class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog, optional: true

  validates :comment, presence: true, length: { maximum: 1000 }

end
