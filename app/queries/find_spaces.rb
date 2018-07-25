class FindSpaces
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  # ADDRESS
  # CAPACITY
  # TITLE
  # PRICE PER HOUR
  # PROPERTIES

  def call(params)
    scoped = search(@initial_scope, params[:search])
    scoped = filter_by_price(scoped, params[:from_price], params[:to_price])
    scoped = filter_by_capacity(scoped, params[:capacity])
    scoped = filter_by_properties(scoped, params[:properties])
    # scoped = filter_by_category(scoped, params[:category_id])
    # scoped = sort(scoped, params[:sort_type], params[:sort_direction])
    # scoped = paginate(scoped, params[:page])
    scoped
  end

  private

  def search(scoped, query = nil)
    query ? scoped.where("title ILIKE '%?%'", query) : scoped
  end

  def filter_by_price(scoped, from_price = nil, to_price = nil)
    scoped = (from_price ? scoped.where('price_per_hour > ?', from_price.to_i) : scoped)
    to_price ? scoped.where('price_per_hour < ?', to_price.to_i) : scoped
  end

  def filter_by_capacity(scoped, capacity = nil)
    capacity ? scoped.where('capacity > ?', capacity.to_i) : scoped
  end

  def filter_by_properties(scoped, properties = nil)
    if properties
      scoped.joins(:space_properties).where(space_properties: {property_id: properties})
    else
      scoped
    end
  end

  # def filter_by_category(scoped, category_id = nil)
  #   category_id ? scoped.where(category_id: category_id) : scoped
  # end

  def sort(scoped, sort_type = :desc, sort_direction = :price)
    scoped.order(sort_type => sort_direction)
  end

  # def paginate(scoped, page_number = 0)
  #   scoped.page(page_number)
  # end
end
