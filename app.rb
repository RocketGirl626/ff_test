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
  @ingredients = @recipe.ingredients
  @instructions = @recipe.instructions
  erb(:recipe)
end

patch('/recipe_name_update/:id') do
  recipe_name = params.fetch("recipe_name")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update(:recipe_name => recipe_name)
  redirect("/recipe/".concat(@recipe.id.to_s))
end

patch('/recipe_source_update/:id') do
  source = params.fetch("source")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update(:source => source)
  redirect("/recipe/".concat(@recipe.id.to_s))
end

patch('/recipe_source_update/:id') do
  source = params.fetch("source")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update(:source => source)
  redirect("/recipe/".concat(@recipe.id.to_s))
end

patch('/recipe_servings_update/:id') do
  servings = params.fetch("servings")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update(:servings => servings)
  redirect("/recipe/".concat(@recipe.id.to_s))
end

patch('/recipe_comment_update/:id') do
  comment = params.fetch("comment")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update(:comment => comment)
  redirect("/recipe/".concat(@recipe.id.to_s))
end

post('/recipe_add_ing/') do
  @recipe = Recipe.find(params.fetch('recipe_id').to_i())
  @ingredient = Ingredient.create({:ingredient_name => params.fetch('ingredient_name'), :recipe_id => @recipe.id})
  redirect("/recipe/".concat(@recipe.id().to_s()))
end

get('/ingredient/:id') do
  @ingredient = Ingredient.find(params.fetch('id'))
  erb(:ingredient)
end

post('/recipe_add_ins/') do
  @recipe = Recipe.find(params.fetch('recipe_id').to_i())
  @instruction = Instruction.create({:instruction_name => params.fetch('instruction_name'), :recipe_id => @recipe.id})
  redirect("/recipe/".concat(@recipe.id().to_s()))
end
