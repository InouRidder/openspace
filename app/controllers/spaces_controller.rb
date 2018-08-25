class SpacesController < ApplicationController
  include HtmlRender
  skip_before_action :verify_authenticity_token, only: :index
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @spaces = FindSpaces.new(Space.includes(:space_properties)).call(search_params)
    else
      @spaces = Space.all
    end

    property_selection_objects unless request.format.json?

    load_markers

    respond_to do |format|
      format.json { render json: {
        spaces_html: render_html_content(partial: "spaces/space", collection: @spaces),
        markers: @markers.to_json
        }
      }
      format.html
    end
  end

  def show
    @booking = Booking.new
    hours = @space.open_hours
    @start_times = hours[:start]
    @end_times = hours[:end]
    @favorite = Favorite.new
  end

  def new
    @space = Space.new
    @selected_props = []
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
      @space.update_properties(space_properties) unless space_properties.empty?
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def destroy
    @space.destroy
    redirect_to host_spaces_path
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_properties
    params.require(:space).permit(:properties => [])[:properties] || []
  end

  def space_params
    params.require(:space).permit(:capacity, :address, :price_per_day, :price_per_hour, :title, :opens, :closes, :minimum_booking_hours)
  end

  def search_params
    params.require(:search).permit(:capacity, :location, :price, :properties, :properties => [])
  end

  def property_selection_objects
    @features = Property.features
    @space_types = Property.space_types
    times = Space.working_hours
    @hours = {
      opening: times[0..-24],
      closing: times[24..-1]
    }
  end

  def load_markers
    @markers = @spaces.map do |space|
      if !space.latitude.nil? && !space.longitude.nil?
        {
          lat: space.latitude,
          lng: space.longitude,
          infoWindow: { content: render_html_content(partial: "/spaces/map_box", locals: { space: space })}
        }
      end
    end.compact
    @markers
  end
end
