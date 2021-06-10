class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,       presence: true
  validates :target_steps,   presence: true

  has_many :pedometers
  has_many :likes

  def liked_by?(pedometer_id)
    likes.where(pedometer_id: pedometer_id).exists?
  end
end
