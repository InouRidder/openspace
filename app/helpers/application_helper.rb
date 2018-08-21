module ApplicationHelper

  def host_route?
    request.env["PATH_INFO"] =~ /host/
  end
end
