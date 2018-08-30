class Host::SpacesController < ApplicationController
  def index
    @spaces = policy_scope(Space)
  end
end
