class DropMenuImageTable < ActiveRecord::Migration
  def change
    drop_table :menu_images
  end
end
