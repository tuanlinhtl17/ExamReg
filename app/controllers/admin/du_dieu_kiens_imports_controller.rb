class Admin::DuDieuKiensImportsController < Admin::AdminController
  def new
    respond_to do |format|
      format.xlsx
    end     
  end

  def create
    if !params[:du_dieu_kiens_import].nil?
      @du_dieu_kiens_import_new = DuDieuKiensImport.new du_dieu_kiens_import_params
      if @du_dieu_kiens_import_new.save 
        @du_dieu_kiens_import_new.status = :importing
        @du_dieu_kiens_import_new.save
        link = admin_ky_thi_mon_thi_path(id: @du_dieu_kiens_import_new.mon_thi.id)
        ImportDuDieuKiensWorker.perform_async [ @du_dieu_kiens_import_new.id, current_admin.id, link ]
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
    params.require(:du_dieu_kiens_import).permit :excel, :mon_thi_id
  end
end
