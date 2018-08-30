class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :space, foreign_key: true
      t.string :billable_adress
      t.float :total_price
      t.string :state, default: 'pending'
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
