class Host::BookingsController < ApplicationController
  def index
    @bookings = current_user.spaces_bookings
  end

  def update_state
    @booking.update_state(params[:state])
    if @booking.save
      redirect_to host_bookings_path
    else
      render 'bookings/show'
    end
  end
end
