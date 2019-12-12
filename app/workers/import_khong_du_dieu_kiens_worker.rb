class ImportKhongDuDieuKiensWorker
  include Sidekiq::Worker

  def perform data
    khong_du_dieu_kiens_import_id = data[0]
    current_admin_id = data[1]
    link = data[2]+ "#khong_du_dk"
    @khong_du_dieu_kiens_import = KhongDuDieuKiensImport.find_by id: khong_du_dieu_kiens_import_id
    if @khong_du_dieu_kiens_import 
      created_at = @khong_du_dieu_kiens_import.created_at.strftime("%H:%M %d/%m/%Y")
      now = Time.now.strftime("%H:%M %d/%m/%Y")
      if @khong_du_dieu_kiens_import.is_valid? && @khong_du_dieu_kiens_import.save_khong_du_dieu_kien
        @khong_du_dieu_kiens_import.status = :success
        @khong_du_dieu_kiens_import.save
        message = { time: created_at, error: false, now: now, link: link }
      else
        @khong_du_dieu_kiens_import.status = :failed
        @khong_du_dieu_kiens_import.add_errors
        @khong_du_dieu_kiens_import.save
        message = { time: created_at, error: true, now: now, link: link }
      end  
    else
      message = { info: "Không tìm thấy file import", error: true, now: now, link: link }
    end 
    ActionCable.server.broadcast "notifications_channel_#{current_admin_id}", message: message.to_json
  end
end
