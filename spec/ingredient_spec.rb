require('spec_helper')

 describe(Ingredient) do 
   it('tells which recipe it belongs to') do
     recipe = Recipe.create({:recipe_name => 'Classic Lemon Curd', :source => 'Fine Dining, April 2009', :servings => 8, :comment => 'This is very good!'})
     ingredient = Ingredient.create({:ingredient_name => 'lemons', :recipe_id => recipe.id})
     expect(ingredient.recipe()).to(eq(recipe))
   end
 end
