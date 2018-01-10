class RemoveAttachmentFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :attachment
  end
end
