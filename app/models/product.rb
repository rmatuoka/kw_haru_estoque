class Product < ActiveRecord::Base
  has_many :supplies
  scoped_search :on => [:name]
end
