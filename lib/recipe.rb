class Recipe < ActiveRecord::Base
  has_many(:ingredients)
  has_many(:instructions)
  has_many(:images)
  belongs_to(:category)
  belongs_to(:menu)
end
