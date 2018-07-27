class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :kind
      t.string :content
      t.boolean :quantifiable

      t.timestamps
    end
  end
end
