class Admin::AdminController < ApplicationController
  # before_action :check_admin
  
  # private
  
  # def check_admin
  #   return if is_admin?
  #   flash[:danger] = "You don't have permission to access"
  #   redirect_back_or root_path
  # end

  # def check_logged_in_js
  #   gon.logged_in = true if current_admin
  # end
end
