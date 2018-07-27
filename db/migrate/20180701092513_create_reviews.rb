class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true, index: true
      t.text :content
      t.integer :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
