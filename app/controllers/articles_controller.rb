class ArticlesController < ApplicationController
  
  def new
    @article = Article.new #created new instance of article
  end
  
  def create
    #render plain: params[:article].inspect #if we want to show that what values that we passed through the form
    @article = Article.new(article_params) #we need to pass a method so that we can know which article to be created
    @article.save
    redirect_to articles.show(@article) #redirect article to articles/show page
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description) #it requires an article key and a permit to save title and description
    end
end