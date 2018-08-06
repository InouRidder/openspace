class BookingsController < ApplicationController
  before_action :set_space, only: :create

  def index
    @bookings = current_user.bookings
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

  private

  def booking_params
    params.require(:booking).permit(:start_datetime, :end_datetime)
  end

  def set_space
    @space = Space.find(params[:space_id])
  end
end
