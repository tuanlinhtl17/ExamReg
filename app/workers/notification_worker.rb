class NotificationWorker
  include Sidekiq::Worker

  def perform sinh_viens_import_id
    sinh_viens_import = SinhViensImport.find_by id: sinh_viens_import_id
    if sinh_viens_import
      ActionCable.server.broadcast "notifications_channel_#{current_admin.id}", message: sinh_viens_import.created_at
    end    
  end
end
