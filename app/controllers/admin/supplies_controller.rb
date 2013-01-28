class Admin::SuppliesController < ApplicationController
  layout "inadmin"
  before_filter :load_products
  
  def index
    @supplies = Supply.all
  end

  def show
    @supply = Supply.find(params[:id])
  end

  def new
    @supply = Supply.new
  end

  def create
    @supply = Supply.new(params[:supply])
    if @supply.save
      redirect_to [:admin, @supply], :notice => "Successfully created supply."
    else
      render :action => 'new'
    end
  end

  def edit
    @supply = Supply.find(params[:id])
  end

  def update
    @supply = Supply.find(params[:id])
    if @supply.update_attributes(params[:supply])
      redirect_to [:admin, @supply], :notice  => "Successfully updated supply."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @supply = Supply.find(params[:id])
    @supply.destroy
    redirect_to admin_supplies_url, :notice => "Successfully destroyed supply."
  end
  
  def load_products
    @products = Product.all(:order => "name ASC").collect { |c| [c.name, c.id] }  
  end
  
end
