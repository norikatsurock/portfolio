class AddFromToBlogcomments < ActiveRecord::Migration[5.1]
  def change
    add_column :blogcomments, :from, :text
  end
end
