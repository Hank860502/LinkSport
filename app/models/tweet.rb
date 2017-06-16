class Tweet < ActiveRecord::Base
	belongs_to :user
  has_many :likes

  validates :body, presence: true, length: { maximum: 140 }
end
