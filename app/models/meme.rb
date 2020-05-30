class Meme < ApplicationRecord
  self.inheritance_column = :_ # Disable STI
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :tags
  has_many :votes
  has_many :voters, through: :votes, source: :user
  has_many :comments

  validates :title, presence: true, uniqueness: true
  validates :url_source, presence: true, url_img: true

  before_create do
    self.votes_count = 0
    self.comments_count = 0
  end
end
