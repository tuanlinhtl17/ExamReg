Rails.application.routes.draw do
  #login routes
  devise_for :sinh_viens, path: "sinh_vien"
  devise_for :admins, path: "admin"

  #admin routes
  namespace "admin" do
    #sidekiq
    require "sidekiq/web"
    require "sidekiq/cron/web"
    mount Sidekiq::Web => "/sidekiq"

    #Websockets
    mount ActionCable.server => "/cable"
    resources :notifications, only: [:index, :update, :create]

    #Manage routes
    root to: "hoc_phans#index"
    resources :hoc_phans, except: [:new, :show]
    resources :sinh_viens, except: [:show] 
    resources :ky_this, except: [:new] do
      resources :mon_this, except: [:index, :new] do
        resources :du_dieu_kiens_imports, only: [:new, :create, :show] 
        resources :khong_du_dieu_kiens_imports, only: [:new, :create, :show]
      end
      resources :ca_thi 
    end
    resources :sinh_viens_imports, only: [:create, :show] 
  end

  root to: "home#index"
end
