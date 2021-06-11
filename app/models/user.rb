class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,       presence: true
  validates :target_steps,   presence: true

  has_many :pedometers
  has_many :likes
  has_many :community_users
  has_many :communities, through: :community_users

  def liked_by?(pedometer_id)
    likes.where(pedometer_id: pedometer_id).exists?
  end
end
