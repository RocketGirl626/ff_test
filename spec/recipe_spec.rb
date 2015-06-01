require('spec_helper')

describe(Recipe) do

  it('creates the recipe header') do
    recipe = Recipe.create({:recipe_name => 'Classic Lemon Curd', :source => 'Fine Dining, April 2009', :servings => 8, :comment => 'This is very good!'})
    expect(recipe.recipe_name()).to(eq(recipe.recipe_name))
  end

  it('tells which ingredients are in it') do
    recipe = Recipe.create({:recipe_name => 'Classic Lemon Curd', :source => 'Fine Dining, April 2009', :servings => 8, :comment => 'This is very good!'})
    ingredient1 = Ingredient.create({:ingredient_name => 'lemons', :recipe_id => recipe.id})
    ingredient2 = Ingredient.create({:ingredient_name => 'sugar', :recipe_id => recipe.id})
    expect(recipe.ingredients()).to(eq([ingredient1, ingredient2]))
  end
end
