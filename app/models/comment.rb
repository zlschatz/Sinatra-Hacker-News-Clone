class Comment < ActiveRecord::Base
  # Remember to create a migration!
  validates :content, presence: true
  validates :post_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :post
end
