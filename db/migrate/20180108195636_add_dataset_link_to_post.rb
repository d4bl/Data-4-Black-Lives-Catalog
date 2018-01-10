class AddDatasetLinkToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :data_set, :string
  end
end
