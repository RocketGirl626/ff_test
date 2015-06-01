class AddImgTable < ActiveRecord::Migration
  def change
  	create_table :images do |t|
  		t.string :image_name
  		t.string :url
  		t.integer :recipe_id
  		t.integer :menu_id
  		t.timestamps null: false
  	end
  end
end
