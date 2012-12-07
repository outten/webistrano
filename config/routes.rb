Shariar::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  root  to: 'projects#dashboard'

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  #get 'service.wsdl#wsdl'
  
  resources :host
  resources :recipes, :collection => {:preview => :get}
#  resources :projects, :member => {:dashboard => :get} do |projects|
#   projects.resources :project_configurations
#   
#   projects.resources :stages, :member => {:capfile => :get, :recipes => :any, :tasks => :get} do |stages|
#     stages.resources :stage_configurations
#     stages.resources :roles
#     stages.resources :deployments, :collection => {:latest => :get}, :member => {:cancel => :post}
#   end
# end
  
  # RESTful auth
  resources :users,:member => {:deployments => :get, :enable => :post}
  resources :sessions, :collection => {:version => :get}
  match  '/signup', :controller => 'users', :action => 'new'
  match  '/login', :controller => 'sessions', :action => 'new'
  match '/logout', :controller => 'sessions', :action => 'destroy'
  

  # Install the default route as the lowest priority.
  match ':controller/:action/:id.:format'
  match ':controller/:action/:id'
end
