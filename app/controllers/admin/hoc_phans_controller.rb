class Admin::HocPhansController < Admin::AdminController
  before_action :find_hoc_phan, only: [:edit, :update, :destroy]

  def index
    @hoc_phans = HocPhan.all
    @hoc_phan_new = HocPhan.new
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def create
    @hoc_phan_new = HocPhan.new hoc_phan_params
    respond_to do |format|
      format.js
    end 
  end

  def edit
  end

  def update
    if @hoc_phan.update(hoc_phan_params)
      respond_to do |format|
        format.js
      end 
    end 
  end

  def destroy
    if @hoc_phan.delete
      @error = false
    else
      @error = "Không thể xóa học phần này"
    end
    respond_to do |format|
      format.js
    end 
  end

  private

  def hoc_phan_params
    params.require(:hoc_phan).permit(:ten, :so_tin_chi)
  end

  def find_hoc_phan
    @hoc_phan = HocPhan.find_by(id: params[:id])
    if !@hoc_phan
      redirect_to admin_root_path
      @error = "Không tìm thấy học phần"
    end
  end
end
