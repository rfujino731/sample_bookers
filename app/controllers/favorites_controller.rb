class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
    # byebug
    if favorite.save
      redirect_to books_path
    else
      redirect_to books_path
    end
  end

  def destroy
    book_favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    book_favorite.destroy
    redirect_to books_path
  end
end
