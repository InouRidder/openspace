class SpacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  def index
    if params[:search]
      @spaces = FindSpaces.new(Space.includes(:space_properties)).call(search_params)
    else
      @spaces = Space.all.first(20)
    end
    @features = Property.features
    @space_types = Property.space_types
    respond_to do |format|
      format.json
      format.html
    end
  end

  def show
  end

  private

  def space_params
    params.require(:space).permit(:capacity)
  end

  def search_params
    params.require(:search).permit(:capacity, :location, :from_price, :to_price, :properties => [])
  end
end
