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
    puts
    "<span id=\"" + options[:field] + "\">" + options[:val] + "</span>" +
    "<img alt=\"Edit\" border=\"0\" id=\"" + options[:field] + "_edit\" src=\"/images/calendar_date_select/calendar.gif\" />" +
    "<script type=\"text/javascript\"> new Ajax.InPlaceEditor('" + options[:field] + "', '/" + options[:model].pluralize + "/" + options[:id] + "/set_" + options[:model] + "_" + options[:field] + "', { okControl:'button', cancelControl:'button', okText:'Submit', cancelText:'Cancel', savingText:'Saving', clickToEditText:'Click here to edit this field', externalControl:'" + options[:field] + "_edit', cols:'37', highlightColor:'#FFFFFF', highlightEndColor:'#FFFFFF', formClassName:'eip_form'}); </script>"
    #<calendar_date_select_tag 'listing_date', '', :hidden => 'true'>
  end
  
end


#<span id="primary_seller">Seller1</span>
#<img alt="Edit" border="0" id="primary_seller_edit" src="/images/edit_icon.png" />
#<script type="text/javascript">
#  new Ajax.InPlaceEditor('primary_seller', '/properties/1/set_property_primary_seller', { okControl:'button', cancelControl:'button', okText:'Submit', cancelText:'Cancel', savingText:'Saving', clickToEditText:'Click here to edit this field', externalControl:'primary_seller_edit', rows:'1', cols:'37', highlightColor:'#FFFFFF', highlightEndColor:'#FFFFFF', formClassName:'eip_form'});
#</script>
