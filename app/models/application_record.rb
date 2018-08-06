class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def class_to_route
    self.class.to_s.singularize.downcase
  end
end
