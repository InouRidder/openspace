class AddPhotosToSpaces < ActiveRecord::Migration[5.1]
  def change
    add_column :spaces, :photos, :json
  end
end
