class Supply < ActiveRecord::Base
  belongs_to :product
  
    validates_presence_of :product_id, :message=> " - preencha o campo!"
    validates_presence_of :quantity, :message=> " - preencha o campo!"
end
