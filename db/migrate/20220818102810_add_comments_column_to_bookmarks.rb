class AddCommentsColumnToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :comment, :string
  end
end
