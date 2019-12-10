class Admin::DuDieuKiensImportsController < Admin::AdminController
  def create
    if !params[:du_dieu_kiens_import].nil?
      @du_dieu_kiens_import_new = DuDieuKiensImport.new du_dieu_kiens_import_params
      if @du_dieu_kiens_import_new.save 
        @du_dieu_kiens_import_new.status = :importing
        @du_dieu_kiens_import_new.save
        mon_thi = @du_dieu_kiens_import_new.get_mon_thi
        link = admin_ky_thi_mon_this_path(params[:mon_thi_id])
        ImportSinhViensWorker.perform_async [ @du_dieu_kiens_import_new.id, current_admin.id, link ]
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
    @du_dieu_kiens_import = DuDieuKiensImport.find_by id: params[:id]
  end

  private

  def du_dieu_kiens_import_params
    params.require(:du_dieu_kiens_import).permit :excel
  end
end
