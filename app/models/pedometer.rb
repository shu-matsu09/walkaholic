class Pedometer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition

  with_options presence: true do
    validates :number_of_steps, numericality: { only_integer: true }
    validates :condition_id, numericality: { other_than: 1, message: 'Select' }
    validates :date
  end
end