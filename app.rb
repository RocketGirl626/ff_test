require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

post('/recipe_add') do
  @recipe_name = params.fetch('recipe_name')
  @source = params.fetch('source')
  @servings = params.fetch('servings')
  @comment = params.fetch('comment')
  @recipe = Recipe.create({:recipe_name => @recipe_name, :source => @source, :servings => @servings, :comment => @comment})
  @recipes = Recipe.all()
  erb(:index)
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  @ingredients = @recipe.ingredients()
  @recipes = Recipe.all()
  @ingredients = Ingredient.all()
  erb(:recipe)
end

post('/recipe_add_ing/') do
  @recipe = Recipe.find(params.fetch('recipe_id').to_i())
  @ingredient = Ingredient.create({:ingredient_name => params.fetch('ingredient_name'), :recipe_id => @recipe.id})
  # @ingredients = @recipe.ingredients()
  @recipes = Recipe.all()
  @ingredients = Ingredient.all()
  erb(:recipe)
end
