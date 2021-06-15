class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.string  :name,             null: false
      t.text    :detail,           null: false
      t.integer :administrator_id, null: false
      t.timestamps
    end
  end
end