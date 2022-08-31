class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    # byebug
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    @books_all = Book.all
    # @user_image = @user.image
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
