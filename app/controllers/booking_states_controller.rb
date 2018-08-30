class BookingStatesController < ApplicationController

  def update
    @booking = Booking.find(params[:id])
    new_state = params[:state].to_sym
    authorize @booking, to_policy(new_state)
    @booking.update_state(new_state)
  end

end
