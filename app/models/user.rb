class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, dependent: :destroy

  has_many :followings, foreign_key: :from_user_id, dependent: :destroy
  has_many :followers, foreign_key: :to_user_id, class_name: 'Following', dependent: :destroy
  has_many :following_users, through: :followings, source: :to_user
  has_many :follower_users, through: :followers, source: :from_user

  has_attached_file :icon
  validates_attachment_content_type :icon, content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
end
