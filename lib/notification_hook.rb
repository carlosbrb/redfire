# encoding: utf-8
# Hooks for notifications
# Thanks to Édouard Brière
# https://github.com/edouard
# Inspired in https://github.com/edouard/redmine_campfire_notifications/blob/master/lib/notifier_hook.rb

require 'tinder'

class Hooks < Redmine::Hook::ViewListener
  def controller_issues_new_after_save(context={ })
    @project = context[:project]
    config = get_config(@project.id)
    @issue = context[:issue]
    @user = @issue.author
    assigned = @issue.assigned_to_id.blank? ? "anyone yet" : "#{@issue.assigned_to.name}"
    message = "#{@user.name} created issue: #{@issue.id}, #{@issue.subject}'. Assigned to: #{assigned} http://#{Setting.host_name}/issues/#{@issue.id}"

    talk(config,message)
  end

  def controller_issues_edit_after_save(context = { })
    @issue = context[:issue]
    @params = context[:params]
    config = get_config(@params[:issue][:project_id])
    @journal = context[:journal]
    talk(config,"#{@journal.user} edited issue: #{@issue.subject}. http://#{Setting.host_name}/issues/#{@issue.id}")

    
  end

  


  def talk(config, message)
    unless config.blank? || config.subdomain.blank? || config.token.blank? || config.room.blank?
      begin
        campfire = Tinder::Campfire.new config.subdomain, :token => config.token
        room = campfire.find_room_by_name(config.room)
        room.speak message
      rescue => e
        #logger.error "Error when trying to talk: #{e.message}"
      end
    end
  end


  def truncate_words(text, length = 20, end_string = '…')
    return if text == nil
    words = text.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end

  def get_config(project_id)
    NotificationConfig.find_by_project_id(project_id)
  end

end
