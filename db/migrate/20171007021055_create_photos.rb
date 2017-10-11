class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :image_id
      t.integer :album_id

      t.timestamps
    end
  end
end
