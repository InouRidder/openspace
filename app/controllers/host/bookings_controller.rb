class Host::BookingsController < ApplicationController
  before_action :set_booking, only: :update_state
  def index
    @bookings = current_user.spaces_bookings.includes(:space)
  end

  def update_state
    @booking.update_state(params[:state])
    if @booking.save
      redirect_to host_bookings_path
    else
      render 'bookings/show'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
