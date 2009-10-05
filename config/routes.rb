ActionController::Routing::Routes.draw do |map|
  
  map.rubyonrails_feed '/feeds/rubyonrails', :controller => 'feeds', :action => 'rubyonrails'
  
  map.import_bookmarks '/bookmarks/import', :controller => 'bookmark_imports', :action => 'import'
  map.do_bookmark_import '/bookmark_imports/do_import', :controller => 'bookmark_imports', :action => 'do_import'
  map.resources :bookmark_imports

  map.resources :codes

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

  map.resources :comments
  
  #map.resources :bookmarks
  map.bookmark_tag_cloud '/bookmarks/tagcloud', :controller => 'bookmarks', :action => 'tag_cloud'
  map.connect '/bookmarks/inc_content_length', :controller => 'bookmarks', :action => 'inc_content_length'
  map.connect '/bookmarks/dec_content_length', :controller => 'bookmarks', :action => 'dec_content_length'
  map.resources :bookmarks, :except => :show

  map.bookmarks_language '/bookmarks/:lang', :controller => 'bookmarks', :action => 'index'
  
  map.with_options :controller => "bookmarks" do |bookmarks|
   bookmarks.bookmark '/bookmarks/:lang/:bookmark_name/', :action => "show", :conditions => {:method => :get}
  end
  
  map.resources :languages

  map.resources :categories

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  
  map.root :controller => 'dashboard'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
