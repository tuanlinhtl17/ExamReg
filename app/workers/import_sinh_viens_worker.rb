class ImportSinhViensWorker
  include Sidekiq::Worker

  def perform data
    sinh_viens_import_id = data[0]
    current_admin_id = data[1]
    link = data[2]+ "#import"
    @sinh_viens_import = SinhViensImport.find_by id: sinh_viens_import_id
    created_at = @sinh_viens_import.created_at.strftime("%H:%M %d/%m/%Y")
    now = Time.now.strftime("%H:%M %d/%m/%Y")
    if @sinh_viens_import 
      if @sinh_viens_import.is_valid? && @sinh_viens_import.save_sinh_vien
        @sinh_viens_import.status = :success
        @sinh_viens_import.save
        message = { time: created_at, error: false, now: now, link: link }
      else
        @sinh_viens_import.status = :failed
        @sinh_viens_import.add_errors
        @sinh_viens_import.save
        message = { time: created_at, error: true, now: now, link: link }
      end  
    else
      message = { info: "Không tìm thấy file import", error: true, now: now, link: link }
    end 
    ActionCable.server.broadcast "notifications_channel_#{current_admin_id}", message: message.to_json
  end
end
