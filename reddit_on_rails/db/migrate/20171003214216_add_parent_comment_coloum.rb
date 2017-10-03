class AddParentCommentColoum < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :parent_comment, :integer
  end
end
