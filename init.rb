require_dependency 'notification_hook'
Redmine::Plugin.register :redfire do
  name 'Redfire'
  author 'Carlos Barbiero'
  description 'Redmine plugin for awesome campfire notifications'
  version '0.0.1'
  url 'https://github.com/carlosbrb/redfire'
  author_url 'https://github.com/carlosbrb'


  project_module :notifications do
    permission :notifications, :notifications => :index
  end
  
  menu :project_menu, :notifications, { :controller => 'notifications', :action => 'index' }, :caption => 'Campfire', :after => :repository, :param => :project_id


end
