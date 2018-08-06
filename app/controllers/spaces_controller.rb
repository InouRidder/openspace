class SpacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @spaces = FindSpaces.new(Space.includes(:space_properties)).call(search_params)
    else
      @spaces = Space.all.first(20)
    end

    unless request.format.json?
      property_selection_objects
      load_markers
    end

    respond_to do |format|
      format.json
      format.html
    end
  end

  def show
  end

  def new
    @space = Space.new
    property_selection_objects
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    @space.set_properties(space_properties) unless space_properties.empty?
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
    property_selection_objects
    @selected_props = @space.properties.pluck(:id)
  end

  def update
    if @space.update(space_params)
      @space.update_properties(space_properties)
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def destroy
    @space.destroy
    redirect_to spaces_path
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_properties
    params.require(:space).permit(:properties => [])[:properties] || []
  end

  def space_params
    params.require(:space).permit(:capacity, :address, :price_per_day, :price_per_hour, :title)
  end

  def search_params
    params.require(:search).permit(:capacity, :location, :from_price, :to_price, :properties => [])
  end

  def property_selection_objects
    @features = Property.features
    @space_types = Property.space_types
    # TO DO: revert back to @spaces.where.not(longitude: nil, latitude: nil) as soon as SQL statement used in query object
  end

  def load_markers
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
