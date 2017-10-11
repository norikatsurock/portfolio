class RemoveCategoryFromBlogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :category, :string
  end
end
