class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog, optional: true

  validates :comment, presence: true, length: { minimum: 3, maximum: 1000 }

end
