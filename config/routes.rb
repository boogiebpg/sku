Rails.application.routes.draw do
  resources :upload_files, only: [:new, :create]
  resources :suppliers,    only: [:index]
  resources :skus,         only: [:index]

  root 'upload_files#new'
end
