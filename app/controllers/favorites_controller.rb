class FavoritesController < ApplicationController
  def create
		favorite = current_user.favorites.new(book_id: params[:book_id])

    favorite.save
    redirect_back(fallback_location: books_path)
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: params[:book_id])

    favorite.destroy
    redirect_to book_path(params[:book_id])
  end
end
