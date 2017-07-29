class CategoriesController < ApplicationController
  before_action:set_category,only:[:show,:edit,:update,:destroy]
  def index
    @categories = Category.all
  end

  def show
    
  end

  def edit
  end
  
  def update
    @category = Category.update(post_params)
    redirect_to category_path(@category)    
  end


  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    @category.save
   redirect_to category_path(@category)
  end  
  def destroy
    @category.destroy
    redirect_to "/categories"
  end    
  private
    def category_params
    params.require(:category).permit(:name,:slug,:parent_category_id)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
