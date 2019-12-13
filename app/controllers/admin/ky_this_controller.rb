class Admin::KyThisController < Admin::AdminController
  before_action :find_ky_thi, only: [:show, :edit, :update, :destroy]

  def index
    @ky_this = KyThi.all
    @ky_thi_new = KyThi.new
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def show
    @mon_this = @ky_thi.mon_this
    @mon_thi_new = MonThi.new
    @hoc_phans = HocPhan.all

    @ca_this = @ky_thi.ca_this
    @ca_thi_new = CaThi.new
    @phong_mays = PhongMay.all

    respond_to do |format|
      format.html
      format.js
    end   
  end

  def create
    @ky_thi_new = KyThi.new ky_thi_params
    @ky_thi_new.save
    respond_to do |format|
      format.js
    end 
  end
  
  def edit
  end

  def update
    if @ky_thi.update(ky_thi_params)
      respond_to do |format|
        format.js
      end 
    end 
  end

  def destroy
    if @ky_thi.delete
      @error = false
    else
      @error = "Không thể xóa kỳ thi này"
    end
    respond_to do |format|
      format.js
    end 
  end

  private

  def ky_thi_params
    params.require(:ky_thi).permit(:ten, :nam_hoc)
  end

  def find_ky_thi
    @ky_thi = KyThi.find_by(id: params[:id])
    if !@ky_thi
      redirect_to admin_ky_this_path
      flash[:error] = "Không tìm thấy kỳ thi"
    end
  end
end
