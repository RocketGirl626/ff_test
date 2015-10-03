class AddMenusTable < ActiveRecord::Migration
  def change
    create_table :menus do |t|
  		t.string :menu_name
  		t.string :comment
      t.integer :season_id
  		t.timestamps null: false
    end
  end
end
