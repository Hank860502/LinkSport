class User < ActiveRecord::Base
	include BCrypt
	has_many :followings_as_follower, :class_name=> "Following", foreign_key: :follower_id
  has_many :followings_as_followee, :class_name=> "Following", foreign_key: :followee_id

  has_many :followers, :through => :followings_as_followee
  has_many :followees, :through => :followings_as_follower

  has_many :tweets

  before_save { self.email = email.downcase }
  validates :username,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def follow(other_user)
  	followees << other_user
  end
  
  def unfollow(other_user)
  	followees.delete(other_user)
  end

  def following?(other_user)
  	folloing.include?(other_user)
  end	

end
