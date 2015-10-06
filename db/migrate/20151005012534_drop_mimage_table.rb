class DropMimageTable < ActiveRecord::Migration
  def change
    drop_table :mimages
  end
end
