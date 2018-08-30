class BookingsController < ApplicationController
  include HtmlRender
  before_action :set_space, only: [:create, :new]
  before_action :set_booking, only: [:destroy, :update, :show, :update_state]
  after_action :authorize_booking, except: :index

  def index
    @bookings = policy_scope(current_user.bookings).includes(:space)
  end

  def show
    @space = @booking.space
    @markers = [
      {
        lat: @space.latitude,
        lng: @space.longitude,
        infoWindow: { content: render_html_content(partial: "/spaces/map_box", locals: { space: @space })}
      }
    ]
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      load_space_show_objects
      render 'spaces/show'
    end
  end

  def update
    @booking.state = params[:state]
    if @booking.save
      redirect_to bookings_path
    else
      @user_bookings = current_user.bookings.includes(:spaces)
      @spaces_bookings = current_user.spaces_bookings.includes(:spaces)
      render :index
    end
  end

  def update_state
    @booking.update_state(params[:state])
    if @booking.save
      redirect_to bookings_path
    else
      render :show
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def authorize_booking
    authorize @booking
  end

  def load_space_show_objects
    hours = @booking.space.open_hours
    @start_times = hours[:start]
    @end_times = hours[:end]
    @favorite = Favorite.new
  end

  def booking_params
    params.require(:booking).permit(:date, :end_time, :start_time)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_space
    @space = Space.find(params[:space_id])
  end
end
