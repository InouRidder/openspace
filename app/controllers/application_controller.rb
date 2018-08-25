class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  include Pundit

  # TO DO: State change validator, I think a specific class object is in order.
end
