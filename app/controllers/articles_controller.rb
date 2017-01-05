class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  
  
  ## refers to rake routes, for actions to take
#    articles GET    /articles(.:format)          articles#index
#             POST   /articles(.:format)          articles#create
# new_article GET    /articles/new(.:format)      articles#new
# edit_article GET    /articles/:id/edit(.:format) articles#edit
#     article GET    /articles/:id(.:format)      articles#show
#             PATCH  /articles/:id(.:format)      articles#update
#             PUT    /articles/:id(.:format)      articles#update
  ##          DELETE /articles/:id(.:format)      articles#destroy
  
  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    # @article = Article.find(params[:id])
  end
  
  def create
    debugger
    # render plain: params[:article].inspect
    
    @article = Article.new(article_params)
    # @article.user = User.first
    @article.user = current_user
    # @article.save
    
    # # redirect_to articles_show(@article)   --WRONG
    #   redirect_to article_path(@article)
      
    if @article.save
      # do something
      
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
      
    else
      render 'new'
    end
  end
  
  
  
  def update
    # @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
      
    else
      render 'edit'
    end
    
  end
  
  def show
    # @article = Article.find(params[:id])
  end
  
  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
      
  end
  
  
  ## move code to method !!
  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
    def require_same_user
      if current_user != @article.user
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to root_path
      end
      
    end
  
end