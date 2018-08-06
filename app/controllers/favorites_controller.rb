class FavoritesController < ApplicationController
  before_action :set_space, only: :create
  before_action :set_favorite, only: :destroy

  def index
    @spaces = current_user.favorited_spaces
  end

  def create
    @favorite = Favorite.new
    @favorite.space = @space
    @favorite.user = current_user
    @favorite.save
    redirect_back(fallback_location: spaces_path)
  end

  def destroy
    @favorite.destroy
    redirect_back(fallback_location: spaces_path)
  end

  private

  def set_space
    @space = Space.find(params[:space_id])
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

end
