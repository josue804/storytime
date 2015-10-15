class Image < ActiveRecord::Base
  validates :url, presence: true

  has_many :stories

  def stories_created_at
    if stories.last != nil
      stories.last.created_at
    end
    0
  end

end
