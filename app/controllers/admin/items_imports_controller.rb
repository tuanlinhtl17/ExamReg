class Admin::ItemsImportsController < Admin::AdminController
  def create
    if !params[:items_import].nil?
      @items_import_new = ItemsImport.new items_import_params
      if @items_import_new.save 
        @items_import_new.status = :importing
        @items_import_new.save
        link = admin_sinh_viens_path 
        ImportItemsWorker.perform_async [ @items_import_new.id, current_admin.id, link ]
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
    @items_import = ItemsImport.find_by id: params[:id]
  end

  private

  def items_import_params
    params.require(:items_import).permit :excel
  end
end
