class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :reactions, dependent: :destroy

  validates :body, presence: true

  scope :count_by_category, -> (category) { joins(:reactions).where("reactions.category": category).count}

  after_create_commit { broadcast_append_to self.post }

  def count_by_category(category)
    Comment.joins(:reactions).where("reactions.category": category).count
  end
end
