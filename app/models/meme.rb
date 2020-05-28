class Meme < ApplicationRecord
  belongs_to :category
  belongs_to :owner

  validates :title, presence: true, uniqueness: true
  validates :url_source, presence: true
end
