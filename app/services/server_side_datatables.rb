# super class for server side datatables
class ServerSideDatatables
  delegate :params, :h, :raw, :link_to, :number_to_currency, :to => :@view

  def initialize(klass,view)
    @klass = klass
    @view = view
    # params.keys.sort.each do |k|
    #   Rails.logger.debug "#{k} => #{params[k]}"
    # end
  end

  def as_json(options = {})
    {
      :draw => params[:draw].to_i,
      :recordsTotal => @klass.count,
      :recordsFiltered => items.total_entries,
      :data => data
    }
  end

  private

  # singleton
  def data
    []
  end

  # singleton
  def columns
    []
  end

  def items
    @items ||= fetch_items
  end

  def fetch_items
    items = filtered_list
    items = selected_columns(items)
    items = items.order(sort_order)
    items = items.page(page).per_page(per_page)

    if params[:search] && params[:search][:value].present?
      items = items.where(quick_search)
    end

    items
  end

  def filtered_list
    @klass.all
  end

  def selected_columns items
    items
  end

  def quick_search
    search_for = params[:search][:value].split(' ')
    terms = {}
    which_one = -1

    criteria = search_for.inject([]) do |criteria, atom|
      which_one += 1
      terms["search#{which_one}".to_sym] = "%#{atom}%"
      criteria << "(#{search_columns.map{|col| "#{col} ILIKE :search#{which_one}"}.join(' OR ')})"
    end.join(' and ')

    [criteria, terms]
  end

  def page
    params[:start].to_i / per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  # TODO: enable multicolumn order and use columns other than 0
  def sort_order
    order_data = params[:order]['0']
    column_name = columns[order_data['column'].to_i]
    direction = order_data['dir'] == 'desc' ? 'desc' : 'asc'

    "#{column_name} #{direction}"
  end

  def search_columns
    cols = []

    params['columns'].each do |k, v|
      cols << columns[k.to_i] if v['searchable'] == 'true'
    end

    cols
  end

end

