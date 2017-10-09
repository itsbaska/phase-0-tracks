class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
