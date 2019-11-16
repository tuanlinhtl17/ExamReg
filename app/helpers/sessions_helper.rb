module SessionsHelper
  def is_admin?
    !current_admin.nil?
  end

  def logged_in?
    sinh_vien_signed_in? || admin_signed_in?
  end

  def user_authenticated?
    if !logged_in?
      flash[:danger] = "Bạn phải đăng nhập trước"
      redirect_to "/sinh_vien/sign_in"
    end
    if is_admin?
      redirect_to admin_root_path
    end
    true
  end

  def redirect_back_or default
    redirect_to session[:forwarding_url] || default
    session.delete :forwarding_url
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
