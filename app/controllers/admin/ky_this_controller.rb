class Admin::KyThisController < Admin::AdminController
  def index
    @ky_this = KyThi.all
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
