class RemoveImagesMenuId < ActiveRecord::Migration
  def change
    remove_column(:images, :menu_id, :integer)
  end
end
