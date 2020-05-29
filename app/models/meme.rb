class Meme < ApplicationRecord
  has_many :comments
  has_many :votes
  self.inheritance_column = :_ # Disable STI
  belongs_to :category
  belongs_to :owner, class_name: "User"

  validates :title, presence: true, uniqueness: true
  validates :url_source, presence: true

  before_create do
    self.votes_count = 0
    self.comments_count = 0
  end
end
