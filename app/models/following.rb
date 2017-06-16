class Following < ActiveRecord::Base
	belongs_to :user
  belongs_to :followee, :class_name => 'User'
  belongs_to :follower, :class_name => 'User'

  validates :follower_id, presence: true, numericality: { only_integer: true}
  validates :followee_id, presence: true, numericality: { only_integer: true }
end
