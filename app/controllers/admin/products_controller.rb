class Admin::ProductsController < ApplicationController
  layout "inadmin"
  def index
    @products = Product.all(:order => :name)
    @supplies = Supply.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to [:admin, @product], :notice => "Successfully created product."
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to [:admin, @product], :notice  => "Successfully updated product."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_url, :notice => "Successfully destroyed product."
  end
  
  def search
    if !params[:keyword].blank?
      @Results = Product.search_for(params[:keyword]).paginate :page => params[:page],:per_page => 20
    end
  end

end
