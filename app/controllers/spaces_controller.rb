class SpacesController < ApplicationController
  def index
    if params[:search]
      @spaces = FindSpaces.new(Space.includes(:space_properties)).call(search_params)
    else
      @spaces = Space.all
    end
    @features = Property.features
    @space_types = Property.space_types
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
