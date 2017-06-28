class CategoriesController < ApplicationController
    before_action :find_category, only: [:show,:destroy,:edit,:update]
    before_action :check_admin, only: [:show,:index,:edit,:destroy,:new]

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
       @category = Category.find(params[:id])
    end
end
