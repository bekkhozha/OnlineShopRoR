class ProductsController < ApplicationController
  before_action :find_product, only: [:show,:destroy,:edit,:update]
  before_action :check_admin, only: [:edit,:new]
  def index
    if params[:category].blank?
      @products = Product.all.order('created_at DESC')
    else
      @category_id = Category.find_by(title: params[:category]).id
      @products = Product.where(:category_id => @category_id).order("created_at DESC")
    end
  end
  def new
        @product = Product.new
    end

  def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def show
    # @product = Product.find(params[:id])
  end
  def edit
  end
  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end
  private
   def product_params
     params.require(:product).permit(:title,:description,:price,:discount,:available, :category_id)
   end
   def find_product
       @product = Product.find(params[:id])
   end
end
