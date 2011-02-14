# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title)
    content_for(:title){ page_title }
  end

  def eip(options)
    if options[:rows]
      num_rows = options[:rows]
    else
      num_rows = '1';
    end

    puts
    "<span id=\"" + options[:field] + "\">" + options[:val] + "</span>" +
    "<img alt=\"Edit\" border=\"0\" id=\"" + options[:field] + "_edit\" src=\"/images/edit_icon.png\" />" +
    "<script type=\"text/javascript\"> new Ajax.InPlaceEditor('" + options[:field] + "', '/" + options[:model].pluralize + "/" + options[:id] + "/set_" + options[:model] + "_" + options[:field] + "', { okControl:'button', cancelControl:'button', okText:'Submit', cancelText:'Cancel', savingText:'Saving', clickToEditText:'Click here to edit this field', externalControl:'" + options[:field] + "_edit', rows:'" + num_rows + "', cols:'37', highlightColor:'#FFFFFF', highlightEndColor:'#FFFFFF', formClassName:'eip_form'}); </script>"

  end

  def eip_select(options)
    puts
    "<span id=\"" + options[:field] + "\">" + options[:val] + "</span>" +
    "<img alt=\"Edit\" border=\"0\" id=\"" + options[:field] + "_edit\" src=\"/images/edit_icon.png\" />" +
    "<script type=\"text/javascript\"> new Ajax.InPlaceCollectionEditor('" + options[:field] + "', '/" + options[:model].pluralize + "/" + options[:id] + "/set_" + options[:model] + "_" + options[:field] + "', { collection:" + options[:collection] + ", okControl:'button', cancelControl:'button', okText:'Submit', cancelText:'Cancel', savingText:'Saving', clickToEditText:'Click here to edit this field', externalControl:'" + options[:field] + "_edit', highlightColor:'#FFFFFF', highlightEndColor:'#FFFFFF', formClassName:'eip_select_form'}); </script>"

  end

  def eip_calendar(options)
    calendar_date_select_tag 'property['+options[:field]+']', options[:val], :popup => :force, :time => false, :buttons => true, :after_close => remote_function(:url => {:action => 'set_property_' + options[:field]}, :with => "'value='+$F(this)" )
  end
end
