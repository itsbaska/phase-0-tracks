class CreateRestaurantsTable < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :cuisine_type
      t.integer :user_id

      t.timestamps
    end
  end
end
