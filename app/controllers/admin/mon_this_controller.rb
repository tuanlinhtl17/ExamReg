class Admin::MonThisController < Admin::AdminController
  before_action :find_mon_thi, except: [:create]

  def show
    @du_dieu_kiens_imports = DuDieuKiensImport.all
    @du_dieu_kiens_import_new = DuDieuKiensImport.new
    @ky_thi = @mon_thi.ky_thi
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def create
    @ky_thi = KyThi.find_by id: params[:ky_thi_id]
    @mon_thi_new = @ky_thi.mon_this.new mon_thi_params
    @mon_thi_new.save
    respond_to do |format|
      format.js
    end 
  end

  def edit
    @ky_thi = @mon_thi.ky_thi
    @hoc_phans = HocPhan.all
  end

  def update
    if @mon_thi.update(mon_thi_params)
      respond_to do |format|
        format.js
      end 
    end 
  end

  def destroy
    if @mon_thi.delete
      @error = false
    else
      @error = "Không thể xóa học phần này"
    end
    respond_to do |format|
      format.js
    end 
  end

  private

  def mon_thi_params
    params.require(:mon_thi).permit(:ky_thi_id, :hoc_phan_id)
  end

  def find_mon_thi
    @mon_thi = MonThi.find_by(id: params[:id])
    if !@mon_thi
      redirect_to admin_root_path
      @error = "Không tìm thấy môn thi"
    end
  end
end
