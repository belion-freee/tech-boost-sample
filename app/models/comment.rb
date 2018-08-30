class Comment < ApplicationRecord
  belongs_to :topic

  validates :comment, presence: true, length: { in: 1..30 }
end
