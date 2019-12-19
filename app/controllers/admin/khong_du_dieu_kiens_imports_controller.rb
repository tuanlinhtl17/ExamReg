class Admin::KhongDuDieuKiensImportsController < Admin::AdminController
  def new
    respond_to do |format|
      format.xlsx
    end     
  end

  def create
    if !params[:khong_du_dieu_kiens_import][:excel].nil?
      @khong_du_dieu_kiens_import_new = KhongDuDieuKiensImport.new khong_du_dieu_kiens_import_params
      if @khong_du_dieu_kiens_import_new.save 
        @khong_du_dieu_kiens_import_new.status = :importing
        @khong_du_dieu_kiens_import_new.save
        link = admin_ky_thi_mon_thi_path(id: @khong_du_dieu_kiens_import_new.mon_thi.id)
        ImportKhongDuDieuKiensWorker.perform_async [ @khong_du_dieu_kiens_import_new.id, current_admin.id, link ]
        @error = false
        respond_to do |format|
          format.js
        end    
      else
        @error = "Đã xảy ra lỗi, vui lòng thử lại"
        respond_to do |format|
          format.js
        end   
      end
    else
      @error = "Bạn phải đính kèm một file excel"
      respond_to do |format|
        format.js
      end       
    end
  end

  def show
    @khong_du_dieu_kiens_import = KhongDuDieuKiensImport.find_by id: params[:id]
  end

  private

  def khong_du_dieu_kiens_import_params
    params.require(:khong_du_dieu_kiens_import).permit :excel, :mon_thi_id
  end
end
