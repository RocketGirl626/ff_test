class AddQuoteSourceColumn < ActiveRecord::Migration
  def change
    add_column(:menus, :quote_source, :string)
  end
end
