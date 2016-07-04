module TextCleaner
  
  def remove_html_tags(stringy)
    ActionController::Base.helpers.strip_tags(stringy)
  end

  def escape_html(stringy)
    CGI::unescapeHTML(stringy)
  end
end