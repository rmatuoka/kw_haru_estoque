class Admin::ReportsController < ApplicationController
  layout "inadmin"
  
  def index
    @supplies_buy = Supply.all(:conditions => ['buy = true'])
    @supplies = Supply.all(:conditions => ['buy = false'])
    @supplies_min = Supply.all
  end
end
