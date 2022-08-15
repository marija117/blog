require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests' do
    it 'ensures user_id presence' do
      comment = Comment.new(body: "asdfghjklq", post_id: 1).save
      expect(comment).to eq(false)
    end

    it 'ensures post_id presence' do
      comment = Comment.new(body: "asdfghjklq", user_id: 1).save
      expect(comment).to eq(false)
    end
  
    it 'ensures body presence' do
      comment = Comment.new(user_id: 1, post_id: 1).save
      expect(comment).to eq(false)
    end

    it 'should save successfully' do
      comment = Comment.new(post_id: 1, body: 'asdfghjklq', user_id: 1).save
      expect(comment).to eq(true)
    end
  end
end