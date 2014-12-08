SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :home, 'home', '/'
    primary.item :competition, 'competition', competitions_path
    primary.item :faq, 'faq', faq_path
    primary.item :top, 'top', top_path
    primary.item :translations, 'translations', translations_path
    primary.item :sandboxes, 'sandboxes', sandboxes_path
    primary.auto_highlight = true
    primary.dom_class = 'nav navbar-nav pull-left'
  end
end