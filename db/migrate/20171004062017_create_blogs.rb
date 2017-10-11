class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :category
      t.string :body
      t.string :image_id

      t.timestamps
    end
  end
end
