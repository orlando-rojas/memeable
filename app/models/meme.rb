class Meme < ApplicationRecord
  self.inheritance_column = :_ # Disable STI
  belongs_to :category
  belongs_to :owner

  validates :title, presence: true, uniqueness: true
  validates :url_source, presence: true, format: { with: /\.(jpg|png|gif)\z/, message: "only allows jpg, png or gif " }
end
