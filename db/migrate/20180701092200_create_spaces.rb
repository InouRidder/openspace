class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :title
      t.integer :capacity
      t.float :price_per_hour
      t.float :price_per_day
      t.time :opens
      t.time :closes
      t.integer :minimum_booking_hours
      t.string :state
      t.text :description

      t.timestamps
    end
  end
end
