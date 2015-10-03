require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all
  @categories = Category.all
  @seasons = Season.all
  erb(:index)
end


post('/category_add/') do
  @cat_name = params.fetch('cat_name')
  Category.create({:cat_name => @cat_name})
  @categories = Category.all()
  @recipes = Recipe.all()
  erb(:index)
end

get('/category/:id') do
  @category = Category.find(params.fetch('id'))
  @recipes = @category.recipes
  erb(:category)
end

post('/season_add/') do
  @seasons = Season.all
  @categories = Category.all
  @recipes = Recipe.all
  @season_name = params.fetch('season_name')
  @date = params.fetch('date')
  @quote_source = params.fetch('quote_source')
  Season.create({:season_name => @season_name, :date => @date, :quote_source => @quote_source})
  erb(:index)
end

get('/season/:id') do
  @season = Season.find(params.fetch('id'))
  @menus = @season.menus
  erb(:season)
end

post('/menu_add') do
  @season = Season.find(params.fetch('season_id').to_i)
  @menus = Menu.all
  @menu_name = params.fetch('menu_name')
  @comment = params.fetch('comment')
  Menu.create({:menu_name => @menu_name, :comment => @comment, :season_id => @season.id})
  erb(:season)
end

get('/menu/:id') do
  @menu = Menu.find(params.fetch('id'))
  @recipes = @menu.recipes
  erb(:menu)
end


get('/images') do
  @images = Image.all
  erb(:images)
end

post('/recipe_add') do
  @categories = Category.all
  @category = Category.find(params.fetch('cat_id').to_i)
  @recipe_name = params.fetch('recipe_name')
  @source = params.fetch('source')
  @servings = params.fetch('servings')
  @comment = params.fetch('comment')
  @recipe = Recipe.create({:recipe_name => @recipe_name, :source => @source, :servings => @servings, :comment => @comment, :cat_id => @category.id})
  @recipes = Recipe.all()
  erb(:index)
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  @ingredients = @recipe.ingredients
  @instructions = @recipe.instructions
  @images = @recipe.images
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

post('/recipe_add_img/') do
  @recipe = Recipe.find(params.fetch('recipe_id').to_i)
  @image_name = params.fetch('image_name')
  @url = params.fetch('url')
  @alt = params.fetch('alt')
  @width = params.fetch('width')
  @height = params.fetch('height')
  @image = Image.create({:image_name => @image_name, :url => @url, :alt => @alt, :width => @width, :height => @height, :recipe_id => @recipe.id})
  @images = Image.all
  redirect("/recipe/#{@recipe.id}")
end

post('/recipe_add_ing/') do
  @recipe = Recipe.find(params.fetch('recipe_id').to_i())
  @ingredient = Ingredient.create({:ingredient_name => params.fetch('ingredient_name'), :recipe_id => @recipe.id, :id => nil})
  redirect("/recipe/#{@recipe.id}")
end

get('/ingredient/:id') do
  @ingredient = Ingredient.find(params.fetch('id'))
  erb(:ingredient)
end

patch('/ingredient_update/:id') do
  ingredient_name = params.fetch("ingredient_name")
  @ingredient = Ingredient.find(params.fetch("id").to_i)
  @ingredient.update(:ingredient_name => ingredient_name)
  @recipes = Recipe.all
  redirect("/recipe/#{@ingredient.recipe_id}")
end

delete('/ingredient/:id') do
  @ingredient = Ingredient.find(params.fetch('id'))
  @ingredient.destroy()
  @recipes = Recipe.all
  redirect("/recipe/#{@ingredient.recipe_id}")
end

post('/recipe_add_ins/') do
  @recipe = Recipe.find(params.fetch('recipe_id').to_i())
  @instruction = Instruction.create({:instruction_name => params.fetch('instruction_name'), :recipe_id => @recipe.id})
  redirect("/recipe/".concat(@recipe.id().to_s()))
end

get('/instruction/:id') do
  @instruction = Instruction.find(params.fetch('id'))
  erb(:instruction)
end

patch('/instruction_update/:id') do
  instruction_name = params.fetch("instruction_name")
  @instruction = Instruction.find(params.fetch("id").to_i)
  @instruction.update(:instruction_name => instruction_name)
  @instructions = Instruction.all
  redirect("/recipe/#{@instruction.recipe_id}")
end

delete('/instruction/:id') do
  @instruction = Instruction.find(params.fetch('id'))
  @instruction.destroy()
  @recipes = Recipe.all
  redirect("/recipe/#{@instruction.recipe_id}")
end

get('/recipe_ready/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  @ingredients = @recipe.ingredients
  @instructions = @recipe.instructions
  @images = @recipe.images
  erb(:recipe_ready)
end

get('/all_recipes/') do
  @recipes = Recipe.all
  erb(:all_recipes)
end

get('/menus/') do

  erb(:menus)
end
