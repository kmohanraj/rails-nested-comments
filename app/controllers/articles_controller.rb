class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :update, :destroy]
  def index 
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
    
  def create
    @article = Article.new(article_params)
    redirect_to @article if @article.save
  end

  def update
    redirect_to @article if @article.save(article_params)
  end

  def destroy
    redirect_to :back if @article.destroy
  end
  
  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
