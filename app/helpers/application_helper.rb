# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper	
  def get_languages
    @languages = Language.all(:order => 'name')
  end
  
  def language_name(id)
    lang = Language.find(id)
    unless lang.nil?
      lang.name
    end
  end
end
