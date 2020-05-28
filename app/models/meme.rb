class Meme < ApplicationRecord
  belongs_to :category
  belongs_to :owner

  self.inheritance_column = :_ # Disable STI

  validates :title, presence: true, uniqueness: true
  validates :url_source, presence: true, format: { with: /\w*(.jpg|.gif|.png)\z/, message: "only allows jpg, png or gif " }
end
