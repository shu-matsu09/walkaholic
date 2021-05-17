class CreatePedometers < ActiveRecord::Migration[6.0]
  def change
    create_table :pedometers do |t|
      t.integer :number_of_steps, null: false
      t.integer :condition_id,    null: false
      t.date    :date,            null: false
      t.timestamps
    end
  end
end
