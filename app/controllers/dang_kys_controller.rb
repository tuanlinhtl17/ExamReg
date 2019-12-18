class DangKysController < ApplicationController
  def index
    @dang_kys = current_sinh_vien.dang_kys
    respond_to do |format|
      format.js
    end 
  end

  def create
    @ket_qua_dang_ky = current_sinh_vien.dang_ky_thi params[:ca_thi_id], params[:phong_may_id] 
    respond_to do |format|
      format.js
    end 
  end

  def destroy
    @dang_ky = current_sinh_vien.dang_kys.find_by params[:id]
    if @dang_ky
      @dang_ky.delete
      @error = false
    else
      @error = true
    end
    respond_to do |format|
      format.js
    end 
  end

  def print
    @dang_kys = current_sinh_vien.dang_kys
    
    respond_to do |format|
      format.html { render layout: false }
      format.pdf do
        render pdf: "Phiếu báo dự thi",
          template: "dang_kys/print.html.erb",
          disposition: "attachment",
          orientation: "Landscape",
          encoding: "UTF-8"
      end
    end 
  end
end
