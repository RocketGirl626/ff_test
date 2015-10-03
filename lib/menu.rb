class Menu < ActiveRecord::Base
  belongs_to(:season)
  has_many(:recipes)
end
