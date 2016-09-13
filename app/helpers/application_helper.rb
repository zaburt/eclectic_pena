module ApplicationHelper

  # change the default link renderer for will_paginate
  # def will_paginate(collection_or_options = nil, options = {})
  #   if collection_or_options.is_a? Hash
  #     options, collection_or_options = collection_or_options, nil
  #   end
  #
  #   unless options[:renderer]
  #     options = options.merge :renderer => FoundationPagination::Rails
  #   end
  #
  #   super *[collection_or_options, options].compact
  # end

  def fonticon(iconname, customclass = '')
    # haml_tag :i, :class => "fi-#{iconname} #{customclass} fonticon"
    "<i class='fi-#{iconname} #{customclass} fonticon'></i>".html_safe
  end

  def format_time(timeval, timeformat = :no_tz_no_sec)
    return nil if timeval.blank?

    timeval.to_s(timeformat)
  end

  def format_hashtag(tags)
    return '' if tags.blank?
    tags.map{|k| "##{k}"}.join(' ')
  end

  def default_date
    Date.new(1970, 1, 1)
  end

end

