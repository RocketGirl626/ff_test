class AddColumnToRecipes < ActiveRecord::Migration
  def change
    add_column(:recipes, :cat_id, :integer)
  end
end
