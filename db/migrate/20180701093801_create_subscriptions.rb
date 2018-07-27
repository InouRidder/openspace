class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.datetime :last_visit
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
