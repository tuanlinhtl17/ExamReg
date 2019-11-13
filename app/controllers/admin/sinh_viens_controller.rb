class Admin::SinhViensController < Admin::AdminController
  before_action :find_sinh_vien, only: [:edit, :update, :destroy]

  def index
    @sinh_viens = SinhVien.all
    @sinh_vien_new = SinhVien.new
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def create
    @sinh_vien_new = SinhVien.new sinh_vien_params
    @sinh_vien_new.save
    respond_to do |format|
      format.js
    end 
  end

  def edit
  end

  def update
    if @sinh_vien.update(sinh_vien_params)
      respond_to do |format|
        format.js
      end 
    end 
  end

  def destroy
    if @sinh_vien.delete
      @error = false
    else
      @error = "Không thể xóa học phần này"
    end
    respond_to do |format|
      format.js
    end 
  end

  private

  def sinh_vien_params
    params.require(:sinh_vien).permit(:ten, :ma_sv, :ngay_sinh, :khoa, :lop)
  end

  def find_sinh_vien
    @sinh_vien = SinhVien.find_by(id: params[:id])
    if !@sinh_vien
      redirect_to admin_root_path
      @error = "Không tìm thấy học phần"
    end
  end
end
