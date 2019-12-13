class Admin::CaThisController < Admin::AdminController
  before_action :find_ca_thi, only: [:edit, :update, :destroy]

  def create
    @ky_thi = KyThi.find_by id: params[:ky_thi_id]
    @ca_thi_new = @ky_thi.ca_this.new ca_thi_params
    @ca_thi_new.save
    respond_to do |format|
      format.js
    end 
  end

  def edit
    @ky_thi = @ca_thi.ky_thi
    @phong_mays = PhongMay.all
    @mon_this = MonThi.all
  end

  def update
    if @ca_thi.update(ca_thi_params)
      respond_to do |format|
        format.js
      end 
    end 
  end

  def destroy
    if @ca_thi.delete
      @error = false
    else
      @error = "Không thể xóa ca thi này"
    end
    respond_to do |format|
      format.js
    end 
  end

  private

  def ca_thi_params
    params.require(:ca_thi).permit(:ten, :bat_dau, :ket_thuc, :ngay_thi, :ky_thi_id, :phong_may_id, :mon_thi_id)
  end

  def find_ca_thi
    @ca_thi = CaThi.find_by(id: params[:id])
    if !@ca_thi
      redirect_to admin_ky_thi_ca_this_path
      flash[:error] = "Không tìm thấy ca thi"
    end
  end
end
