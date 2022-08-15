require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    it 'ensures user_id presence' do
      post = Post.new(title: "First Post", text: 'asdfghjklq').save
      expect(post).to eq(false)
    end

    it 'ensures title presence' do
      post = Post.new(text: "asdfghjklpo", user_id: 1).save
      expect(post).to eq(false)
    end

    it 'ensures text presence' do
      post = Post.new(title: "First Post", user_id: 1).save
      expect(post).to eq(false)
    end

    it 'ensures text at least 10 character long' do
      post = Post.new(title: 'First Post', text: 'abc', user_id: 1).save
      expect(post).to eq(false)
    end

    it 'should save successfully' do
      post = Post.new(title: 'First Post', text: "asdfghjklpo", user_id: 1).save
      expect(post).to eq(true)
    end
  end
end