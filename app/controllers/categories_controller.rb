class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("created_at DESC")
  end
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  def show
    @category = Category.find(params[:id])
  end

  def update
  end

  def destroy
  end



  def edit
  end
  private
   def category_params
     params.require(:category).permit(:title,:parent_id)
   end
end
