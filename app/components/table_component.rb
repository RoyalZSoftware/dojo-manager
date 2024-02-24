# frozen_string_literal: true

class TableComponent < ViewComponent::Base
  def initialize(headers, data_provider, page = 0, limit = 10)
    @data_provider = data_provider
    @headers = headers
    @data = data_provider.get_items(page, limit)
    @page = page
    @limit = limit
    @header_translations = {}
    @column_links = {}
  end

  public
  def define_custom_header_name_for(key, view_string)
    @header_translations[key] = view_string
  end

  def define_link_for_column(column_key, &link_factory)
    @column_links[column_key] = link_factory
  end

  def build_page_link(new_page)
    "?page=#{new_page}"
  end

  private
  def can_go_back?
    @page != 0
  end

  def has_next_page?
    @data.length == @limit && @data_provider.get_items(@page + 1, @limit).count > 0
  end
end

class SimpleModelPagination
  def initialize(model)
    @model = model
  end

  def get_items(page, limit)
    @model.limit(limit).offset(page * limit)
  end
end
