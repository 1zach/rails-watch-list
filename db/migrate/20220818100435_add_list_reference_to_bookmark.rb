class AddListReferenceToBookmark < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookmarks, :list
  end
end
