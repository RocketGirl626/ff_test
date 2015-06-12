class AddInitialTables < ActiveRecord::Migration

  def change
  	create_table :recipes do |t|
  		t.string :recipe_name
  		t.string :source
  		t.string :servings
  		t.string :comment
  		t.timestamps null: false
  	end

    create_table :categories do |t|
      t.string :cat_name
      t.timestamps null: false
    end

    create_table :categories_recipes, id: false do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :category, index: true
    end

    create_table :ingredients do |t|
    	t.string :ingredient_name
    	t.integer :recipe_id
    	t.timestamps null: false
    end

    create_table :instructions do |t|
    	t.string :instruction_name
    	t.integer :recipe_id
    	t.timestamps null: false
    end
  end
end
