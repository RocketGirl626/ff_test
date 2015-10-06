class CreateMimageTable < ActiveRecord::Migration
  def change
    create_table :mimages do |t|
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
