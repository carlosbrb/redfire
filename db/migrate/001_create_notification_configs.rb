class CreateNotificationConfigs < ActiveRecord::Migration
  def change
    create_table :notification_configs do |t|
      t.string :project_id, :limit => 50
      t.string :token, :limit => 100
      t.string :room, :limit => 50
      t.string :subdomain, :limit => 70


    end
  end
end
