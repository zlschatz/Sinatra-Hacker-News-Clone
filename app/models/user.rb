class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :posts
  has_many :comments
end
