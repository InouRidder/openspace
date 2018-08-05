class FindSpaces
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    params = format_params(params)
    scoped = @initial_scope
    scoped = filter_by_location(scoped, params[:location])
    scoped = filter_by_price(scoped, params[:from_price], params[:to_price])
    scoped = filter_by_capacity(scoped, params[:capacity])
    scoped = filter_by_properties(scoped, params[:properties])
    # scoped = sort(scoped, params[:sort_type], params[:sort_direction])
    # scoped = paginate(scoped, params[:page])
    scoped
  end

  private

  def search(scoped, query = nil)
    query ? scoped.where("title ILIKE '%?%'", query) : scoped
  end

  def filter_by_location(scoped, location = nil)
    location ? scoped.near(location, 50) : scoped
  end

  def filter_by_price(scoped, from_price = nil, to_price = nil)
    scoped = (from_price ? scoped.where('price_per_hour > ?', from_price.to_i) : scoped)
    to_price ? scoped.where('price_per_hour < ?', to_price.to_i) : scoped
  end

  def filter_by_capacity(scoped, capacity = nil)
    capacity ? scoped.where('capacity >= ?', capacity.to_i) : scoped
  end

  def filter_by_properties(scoped, properties = nil)
    if properties
      # TO DO: Find an inclusive search through SQL query to improve performancegem -> Did not want to attribute time to investigating
      # ActiveRecord::Base.connection.execute("SELECT * FROM spaces s JOIN space_properties sp ON sp.space_id = s.id WHERE sp.property_id = ALL (SELECT property_id FROM space_properties WHERE property_id IN (#{properties.join(",")}))")
      properties.map!(&:to_i)

      # sql = "SELECT *, COUNT(sp.id) as c FROM spaces s JOIN space_properties sp ON sp.space_id = s.id WHERE c >= ALL(SELECT COUNT(*) FROM space_properties spd WHERE spd.property_id IN (#{properties.join(",")}))"

      # SELECT * FROM spaces s JOIN space_properties sp ON sp.space_id = s.id WHERE COUNT(sp) > ALL (SELECT COUNT(*) FROM sp WHERE sp.property_id IN properties)

      scoped.select { |space| (space.space_properties.pluck(:property_id) & properties).length == properties.length }
    else
      scoped
    end
  end

  def sort(scoped, sort_type = :desc, sort_direction = :price)
    scoped.order(sort_type => sort_direction)
  end

  # def paginate(scoped, page_number = 0)
  #   scoped.page(page_number)
  # end

  def format_params(params)
    params.transform_values! { |value| value == "" ? nil : value }
  end
end
