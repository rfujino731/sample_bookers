class BookCommentsController < ApplicationController
  def create
    @comment = current_user.book_comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path) 
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end
  
  private
  def comment_params
    params.require(:book_comment).permit(:comment, :book_id)
  end
end
