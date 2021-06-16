class Community < ApplicationRecord
  has_many :community_users, dependent: :destroy
  has_many :users, through: :community_users

  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 20 }
  validates :detail, presence: true, length: { maximum: 200 }
end
