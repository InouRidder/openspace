class SpacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def index
    if params[:search]
      @spaces = FindSpaces.new(Space.includes(:space_properties)).call(search_params)
    else
      @spaces = Space.all.first(20)
    end

    initial_object_load unless request.format.json?

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

  def initial_object_load
    @features = Property.features
    @space_types = Property.space_types
    # TO DO: revert back to @spaces.where.not(longitude: nil, latitude: nil) as soon as SQL statement used in query object
    @markers = @spaces.map do |space|
      if space.geocoded?
        {
          lat: space.latitude,
          lng: space.longitude,
          infoWindow: { content: render_to_string(partial: "/spaces/map_box", locals: { space: space })}
        }
      end
    end
  end
end
