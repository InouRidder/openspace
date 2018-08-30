module ApplicationHelper

  def host_route?
    request.env["PATH_INFO"] =~ /host/
  end

  def pluralize(word, count)
    word = word.pluralize unless count == 1
    "#{count} #{word}"
  end

  def to_policy(word)
    (word + "?").to_sym
  end
end
