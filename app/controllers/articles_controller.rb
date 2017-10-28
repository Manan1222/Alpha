class ArticlesController < ApplicationController
  
  #before action calls the "set_article"  method before this specified action
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    # @articles can be any name I just assigned it to understand that here I am listing all the articles
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new #created new instance of article
  end
  
  def edit
    
  end
  
  def create
    #render plain: params[:article].inspect #if we want to show that what values that we passed through the form
    @article = Article.new(article_params) #we need to pass a method so that we can know which article to be created
    @article.user = current_user 
    if @article.save
      flash[:success] = "Album was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
    #@article.save
    #redirect_to articles_path(@article) #redirect article to articles/show page
  end
  
  def update
   
    if @article.update(article_params)
      flash[:success] = "Album was successfully Updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
   
  end
  
  def destroy
    
     @article.destroy
      flash[:danger] = "Album was successfully Deleted"
     redirect_to articles_path
     
  end
  
  
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description, images_files: []) #it requires an article key and a permit to save title and description
    end
  
  def require_same_user
    if current_user != @article.user
      flash[:danger] = "You can only delete your Album or Photos"
      redirect_to root_path
    end
  end
end