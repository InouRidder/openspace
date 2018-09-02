class Host::SpacesController < ApplicationController
  def index
    @spaces = policy_scope(Space, policy_scope_class: HostSpacePolicy::Scope)
  end
end
