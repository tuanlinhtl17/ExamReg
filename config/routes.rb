Rails.application.routes.draw do
  #login routes
  devise_for :sinh_viens, path: "sinh_vien"
  devise_for :admins, path: "admin"

  namespace "admin" do
    root to: "hoc_phans#index"
    resources :hoc_phans, except: [:new, :show]
    resources :sinh_viens, except: [:new, :show] 
    resources :ky_this, except: [:new, :show]  
  end

  root to: "home#index"
end
