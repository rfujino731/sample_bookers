class BooksController < ApplicationController
  before_action :only_current_user, only: [:edit, :update]

  def new
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
    @book_comments = @book.book_comments
    @book_comment = BookComment.new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      puts("########################")
      puts(@book.errors)
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def only_current_user
    book = Book.find(params[:id])
    redirect_to books_path unless book.user_id == current_user.id
  end
end
