class Recipe < ActiveRecord::Base
  has_many(:ingredients)
  has_many(:instructions)
  has_many(:images)
end
