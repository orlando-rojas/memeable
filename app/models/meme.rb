class Meme < ApplicationRecord
  self.inheritance_column = :_ # Disable STI
  belongs_to :category
  belongs_to :owner, class_name: 'User'

  validates :title, presence: true, uniqueness: true
  validates :url_source, presence: true, format: { with: /\.(jpg|png|gif)\z/, message: "only allows jpg, png or gif " }

  before_create do
    self.votes_count = 0
    self.comments_count = 0
  end
end
