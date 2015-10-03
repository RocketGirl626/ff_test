require('spec_helper')

describe(Category) do

  it('creates a new category') do
    category = Category.create({:cat_name => 'italian'})
    expect(category.cat_name()).to(eq(category.cat_name))
  end

end
