class Contribution < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :user
  belongs_to :image
  belongs_to :story

end
