class Host::BookingsController < ApplicationController
  before_action :set_booking, only: :update_state
  after_action :authorize_booking, except: :index

  def index
    @bookings = policy_scope(Booking).includes(:space)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def authorize_booking
    authorize @booking
  end
end
