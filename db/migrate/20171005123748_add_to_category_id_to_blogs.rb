class AddToCategoryIdToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :category_id, :integer
  end
end
