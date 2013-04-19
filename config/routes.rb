# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'notifications', :to => "notifications#index"
put 'notifications', :to => "notifications#update"