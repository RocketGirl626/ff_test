class UpdateImagesWidth < ActiveRecord::Migration
  def change
    add_column(:images, :width, :integer)
  end
end
