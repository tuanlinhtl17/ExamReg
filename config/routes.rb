Rails.application.routes.draw do
  get 'hoc_phans/new'
  get 'hoc_phans/create'
  get 'hoc_phans/update'
  get 'hoc_phans/edit'
  get 'hoc_phans/destroy'
  get 'hoc_phans/index'
  root to: 'home#index'
end
