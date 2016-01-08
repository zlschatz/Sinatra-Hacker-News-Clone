class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :posts
  has_many :comments
  has_many :comment_votes
  has_many :post_votes
end
