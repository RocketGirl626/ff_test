class RemoveCatidColumn < ActiveRecord::Migration
  def change
    remove_column :recipes, :cat_id
  end
end
