class Meme < ApplicationRecord
  self.inheritance_column = :_ # Disable STI
  belongs_to :category
  belongs_to :owner
end
