class ChangeImageRecipeAssociation < ActiveRecord::Migration
  def change
    add_column(:images, :recipe_id, :integer)
    remove_column(:recipes, :image_id, :integer)
  end
end
