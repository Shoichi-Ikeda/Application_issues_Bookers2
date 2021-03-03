class RenameBookCoommentToBookComment < ActiveRecord::Migration[5.2]
  def change
    rename_table :book_coomments, :book_comments
  end
end
