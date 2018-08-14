class BookingsController < ApplicationController
  before_action :set_space, only: [:create, :new]
  before_action :set_booking, only: [:destroy, :update]

  def index
    @user_bookings = current_user.bookings.includes(:space)
    @spaces_bookings = current_user.spaces_bookings.includes(:space)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    if @booking.save
      redirect_to root_path
    else
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

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_space
    @space = Space.find(params[:space_id])
  end
end
