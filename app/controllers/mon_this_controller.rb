class MonThisController < ApplicationController
  def index
    @mon_this = current_sinh_vien.load_mon_this
    @dang_kys = current_sinh_vien.dang_kys
    respond_to do |format|
      format.html
      format.js
    end 
  end

  def show
    @mon_thi = MonThi.find_by id: params[:id]
    @ca_this = @mon_thi.ca_this
  end
end
