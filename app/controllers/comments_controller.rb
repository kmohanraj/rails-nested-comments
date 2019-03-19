class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end
  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to  articles_path, notice: 'your comment was successfully posted!'
    else
      redirect_to :new, notice: "your comment wasn't posted!"
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @article = Article.find(params[:id]) if params[:id]
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
  end

end
