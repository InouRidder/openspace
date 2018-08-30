class BookingStatesController < ApplicationController

  def update
    @booking = Booking.find(params[:id])
    new_state = params[:state].to_sym
    authorize @booking, to_policy(new_state)
    @booking.update_state(new_state)
    redirect_back(fallback_location: bookings_path)
  end

  private

  def to_policy(word)
    (word.to_s + "?").to_sym
  end

end
