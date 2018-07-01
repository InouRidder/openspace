class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.integer :capacity
      t.float :price_per_hour
      t.float :price_per_day
      t.string :state

      t.timestamps
    end
  end
end
