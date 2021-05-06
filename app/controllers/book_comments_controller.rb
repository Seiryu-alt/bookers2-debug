class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    book_comment = current_user.book_comments.new(book_comment_params)
    book_comment.book_id = @book.id
    if book_comment.save
      @book_comment = BookComment.new
    else
      @book_comment = book_comment
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
    book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id], user_id: current_user.id)
    
    if book_comment
      book_comment.destroy
    end
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
