class AddColumnsToMenuTable < ActiveRecord::Migration
  def change
    add_column(:menus, :url, :string)
    add_column(:menus, :alt, :string)
    add_column(:menus, :width, :integer)
    add_column(:menus, :height, :integer)
  end
end
