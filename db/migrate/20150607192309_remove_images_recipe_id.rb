class RemoveImagesRecipeId < ActiveRecord::Migration
  def change
    remove_column(:images, :recipe_id, :integer)
  end
end
