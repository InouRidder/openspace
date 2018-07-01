class CreateSpaceProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :space_properties do |t|
      t.references :property, foreign_key: true
      t.references :space, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
