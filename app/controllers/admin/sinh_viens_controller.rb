class Admin::SinhViensController < Admin::AdminController
  def index
    @sinh_viens = SinhVien.all
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
