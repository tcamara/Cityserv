module PropertiesHelper

  def sort_td_class_helper(param)
    result = 'class="sortup"' if params[:sort] == param
    result = 'class="sortdown"' if params[:sort] == param + "_reverse"
    return result
  end

  def sort_link_helper(text, param)
    key = param
    key += "_reverse" if params[:sort] == param
    options = {
        :url => {:action => 'list', :params => params.merge({:sort => key})},
        :update => 'browse_table'
    }
    html_options = {
      :title => "Sort by this field",
      :href => url_for(:action => 'list', :params => params.merge({:sort => key}))
    }
    link_to(text, options, html_options)
  end

end
