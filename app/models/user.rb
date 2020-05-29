class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

  has_many :votes
  has_many :memes, foreign_key: 'owner_id'
  validates :username,  presence: true, uniqueness: true
  validates :email,  presence: true, uniqueness: true
  
  before_create do
    self.memes_count = 0
  end
end
