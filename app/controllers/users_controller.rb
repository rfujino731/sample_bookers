class UsersController < ApplicationController
  def show
    # byebug
    @user = User.find(params[:id])
    # @user_image = @user.image
  end

  def index
  end

  def edit
  end

  def updata
  end
end
