class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :user_id, presence: true

  validate :either_url_or_story

  belongs_to :user
  has_many   :comments
  has_many   :post_votes

  def either_url_or_story
    if self.url? && self.story?
      errors.add(url:"You can't have a URL if a story is present")
    end
  end
end
