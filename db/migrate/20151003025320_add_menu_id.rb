class AddMenuId < ActiveRecord::Migration
  def change
    add_column(:recipes, :menu_id, :integer)
  end
end
