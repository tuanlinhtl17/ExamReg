class Admin::AdminController < ApplicationController
  before_action :check_admin
  
  private
  
  def check_admin
    return if is_admin?
    redirect_back_or "/404"
  end

  # def check_logged_in_js
  #   gon.logged_in = true if current_admin
  # end
end
