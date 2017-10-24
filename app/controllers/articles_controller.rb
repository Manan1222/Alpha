class ArticlesController < ApplicationController
  
  def new
    @article = Article.new #created new instance of article
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    #render plain: params[:article].inspect #if we want to show that what values that we passed through the form
    @article = Article.new(article_params) #we need to pass a method so that we can know which article to be created
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
    #@article.save
    #redirect_to articles_path(@article) #redirect article to articles/show page
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully Updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  
  private
    def article_params
      params.require(:article).permit(:title, :description) #it requires an article key and a permit to save title and description
    end
end