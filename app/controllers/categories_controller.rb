class CategoriesController < ApplicationController
  def index
    # @categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 5)  ## run rake test >> ensure code not broke
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(cate_params)
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    
  end
  
  private
  def cate_params
    params.require(:category).permit(:name)
  end
  
  
end