class Admin::SinhViensImportsController < Admin::AdminController
  def create
    if !params[:sinh_viens_import].nil?
      @sinh_viens_import_new = SinhViensImport.new sinh_viens_import_params
      if @sinh_viens_import_new.save 
        @sinh_viens_import_new.status = :importing
        @sinh_viens_import_new.save
        link = admin_sinh_viens_path 
        ImportSinhViensWorker.perform_async [ @sinh_viens_import_new.id, current_admin.id, link ]
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
    @sinh_viens_import = SinhViensImport.find_by id: params[:id]
  end

  private

  def sinh_viens_import_params
    params.require(:sinh_viens_import).permit :excel
  end
end
