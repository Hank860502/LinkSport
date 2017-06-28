class User < ActiveRecord::Base
	include BCrypt

  mount_uploader :avatar, AvatarUploader
  
	has_many :followings_as_follower, :class_name=> "Following", foreign_key: :follower_id
  has_many :followings_as_followee, :class_name=> "Following", foreign_key: :followee_id

  has_many :followers, :through => :followings_as_followee
  has_many :followees, :through => :followings_as_follower

  has_many :tweets

  before_save { self.email = email.downcase }
  validates :first_name, :last_name, :email, :username,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  # validates :password, confirmation: true, presence: true, length: { minimum: 6 }
  
  def avatar_url
    if self.avatar.url.nil?
      return "/avatar.png"
    else
      return self.avatar.url
    end
  end

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
