class ApplicationController < ActionController::Base
  include SessionsHelper

  layout :layout_by_resource

  before_action :check_logged_in, :check_admin 

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def check_admin
    return if !is_admin? || request.env['PATH_INFO'] == destroy_admin_session_path
    redirect_to "/admin"
  end

  def check_logged_in
    return if logged_in? || request.env['PATH_INFO'] == new_sinh_vien_session_path || request.env['PATH_INFO'] == new_admin_session_path
    redirect_to new_sinh_vien_session_path
  end
end
