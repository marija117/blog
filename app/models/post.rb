class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :title, presence: true
    validates :text, presence: true, length: { minimum: 10 }
    
    after_create_commit {broadcast_append_to self.user}
end
