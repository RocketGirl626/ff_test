class AddImageId < ActiveRecord::Migration
  def change
    add_column(:recipes, :image_id, :integer)
  end
end
