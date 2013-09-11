class Product < ActiveRecord::Base
  has_many :supplies, :dependent => :destroy
  scoped_search :on => [:name]
end
