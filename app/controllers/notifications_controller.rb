class NotificationsController < ApplicationController
  unloadable
  
  before_filter :find_project, :authorize, :create_config_if_not_exists, :only => [:index]
  
  def index
    
   
  end

  def update
    @config = NotificationConfig.find_by_project_id(params[:notification_config][:project_id])
    @config.update_attributes(params[:notification_config])

    respond_to do |format|
      format.html{redirect_to ({:project_id => params[:notification_config][:project_id]}), :notice => l(:success_config_save)}
    end

  end




  private

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end

  def create_config_if_not_exists
    @config = NotificationConfig.find_by_project_id(@project.id)
    if @config.blank?
      @config = NotificationConfig.create(:project_id => @project.id)
    end
    

  end

end
