class NotificationWorker
  include Sidekiq::Worker

  def perform items_import_id
    items_import = ItemsImport.find_by id: items_import_id
    if items_import
      ActionCable.server.broadcast "notifications_channel_#{current_admin.id}", message: items_import.created_at
    end    
  end
end
