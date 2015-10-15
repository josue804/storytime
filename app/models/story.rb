class Story < ActiveRecord::Base

  has_many :contributions

  def contributions_created_at
    if contributions.last != nil
      self.contributions.last.created_at
    end
    0
  end

end
