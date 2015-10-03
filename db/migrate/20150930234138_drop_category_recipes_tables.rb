class DropCategoryRecipesTables < ActiveRecord::Migration
  def change
    drop_table :categories_recipes
  end
end
