class AddMenuIdColumnToImages < ActiveRecord::Migration
  def change
    add_column(:images, :menu_id, :integer)
  end
end
