class CategoriesController < ApplicationController
    before_action :find_category, only: [:show,:edit,:update,:destroy]
  def index
    @categories = Category.all.order("created_at DESC")
  end
  def new
    if current_user.admin?
      @category = Category.new
    end
  end

  def create
    if current_user.admin?
      @category = Category.new(category_params)
      if @category.save
        redirect_to root_path
      else
        render 'new'
      end
    end
  end
  def show
    # @category = Category.find(params[:id])
  end
  def edit
  end

  def update

  end

  def destroy

  end
  private
   def category_params
     params.require(:category).permit(:title,:parent_id)
   end
   def find_category
     if current_user.admin?
       @category = Category.find(params[:id])
     end
   end
end
