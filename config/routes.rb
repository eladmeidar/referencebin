ActionController::Routing::Routes.draw do |map|
  map.resources :questions

  
  map.signup '/register', :controller => 'users', :action => 'new'
  map.login  '/login',  :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.resource :session
  map.resources :users, :member => { :suspend => :put, :unsuspend => :put, :purge => :delete }

  #bookmark imports
  map.convert_all_bookmarks '/bookmark_imports/convert_all', :controller => 'bookmark_imports', :action => 'convert_all'
  map.convert_bookmark '/bookmark_imports/:id/convert', :controller => 'bookmark_imports', :action => 'convert'
  map.import_bookmarks '/bookmarks/import', :controller => 'bookmark_imports', :action => 'import'
  map.do_bookmark_import '/bookmark_imports/do_import', :controller => 'bookmark_imports', :action => 'do_import'
  map.resources :bookmark_imports

  #codes
  map.resources :codes

  #users & sessions
  map.resources :users, :path_prefix => '/administration'
  #settings
  map.settings '/settings', :controller => 'settings', :action => 'index'
  
  #comments
  map.resources :comments
  
  #bookmarks
  map.bookmarks_by_tag '/bookmarks/tags/:tag', :controller => 'bookmarks', :action => 'tags'
  map.bookmark_tag_cloud '/bookmarks/tags', :controller => 'bookmarks', :action => 'tags'
  map.connect '/bookmarks/inc_content_length', :controller => 'bookmarks', :action => 'inc_content_length'
  map.connect '/bookmarks/dec_content_length', :controller => 'bookmarks', :action => 'dec_content_length'
  map.resources :bookmarks, :except => :show
  map.bookmarks_language '/bookmarks/:lang', :controller => 'bookmarks', :action => 'index'
  map.with_options :controller => "bookmarks" do |bookmarks|
   bookmarks.bookmark '/bookmarks/:lang/:bookmark_name/', :action => "show", :conditions => { :method => :get }
  end
  
  #languages
  map.resources :languages
  
  #administration
  ##users are mapped with path_prefix of /administration
  map.administration '/administration', :controller => 'administration', :action => 'index'

  #pages
  map.credits '/credits', :controller => 'pages', :action => 'credits'
  map.termsofuse '/termsofuse', :controller => 'pages', :action => 'termsofuse'
  map.privacypolicy '/privacypolicy', :controller => 'pages', :action => 'privacypolicy'
  
  #root
  map.root :controller => 'bookmarks'
  
  #derault routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
