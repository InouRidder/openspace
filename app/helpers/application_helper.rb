module ApplicationHelper

  def host_route?
    request.env["PATH_INFO"] =~ /host/
  end

  def pluralize(word, count)
    word = word.pluralize unless count == 1
    "#{count} #{word}"
  end
end
