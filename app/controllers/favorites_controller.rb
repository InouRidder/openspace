class FavoritesController < ApplicationController
  before_action :set_space, only: :create
  before_action :set_favorite, only: :destroy
  after_action :authorize_favorite, except: :index

  def index
    @spaces = policy_scope(Space)
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

  def authorize_favorite
    authorize @favorite
  end

  def set_space
    @space = Space.find(params[:space_id])
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

end
