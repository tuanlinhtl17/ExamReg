class ImportDuDieuKiensWorker
  include Sidekiq::Worker

  def perform data
    du_dieu_kiens_import_id = data[0]
    current_admin_id = data[1]
    link = data[2]+ "#import"
    @du_dieu_kiens_import = DuDieuKiensImport.find_by id: du_dieu_kiens_import_id
    created_at = @du_dieu_kiens_import.created_at.strftime("%H:%M %d/%m/%Y")
    now = Time.now.strftime("%H:%M %d/%m/%Y")
    if @du_dieu_kiens_import 
      if @du_dieu_kiens_import.is_valid? && @du_dieu_kiens_import.save_du_dieu_kien
        @du_dieu_kiens_import.status = :success
        @du_dieu_kiens_import.save
        message = { time: created_at, error: false, now: now, link: link }
      else
        @du_dieu_kiens_import.status = :failed
        @du_dieu_kiens_import.add_errors
        @du_dieu_kiens_import.save
        message = { time: created_at, error: true, now: now, link: link }
      end  
    else
      message = { info: "Không tìm thấy file import", error: true, now: now, link: link }
    end 
    ActionCable.server.broadcast "notifications_channel_#{current_admin_id}", message: message.to_json
  end
end
