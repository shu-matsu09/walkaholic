class AddUserToPedometers < ActiveRecord::Migration[6.0]
  def change
    add_reference :pedometers, :user, null: false, foreign_key: true
  end
end
