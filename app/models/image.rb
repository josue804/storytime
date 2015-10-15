class Image < ActiveRecord::Base
  validates :url, presence: true

  has_many :contributions

  def contributions_created_at
    if contributions.last != nil
      contributions.last.created_at
    end
    0
  end

end
