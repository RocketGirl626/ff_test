class CreateMenuImagesTable < ActiveRecord::Migration
  def change
  	create_table :menu_images do |t|
  		t.string :image_name
  		t.string :url
      t.string :alt
      t.integer :width
      t.integer :height
  		t.integer :menu_id
  		t.timestamps null: false
  	end
  end
end
