class CreateSeasonsTable < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
  		t.string :season_name
  		t.string :date
      t.string :quote_source
  		t.timestamps null: false
    end
  end
end
