class CreateSpaceAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :space_attachments do |t|
      t.references :space, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
