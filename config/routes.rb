Rails.application.routes.draw do
  namespace "admin" do
    root to: "hoc_phans#index"
    resources :hoc_phans, except: [:new, :show]
    resources :sinh_viens, except: [:new, :show] 
    resources :ky_this, except: [:new, :show]  
  end
end
