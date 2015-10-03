class Season < ActiveRecord::Base
  has_many(:menus)
end
