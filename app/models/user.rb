class User < ApplicationRecord
  has_many :votes
  has_many :voted_memes, through: :votes, source: :meme
  has_many :comments
  has_many :commented_memes, through: :comments, source: :meme
end
