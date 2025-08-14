Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "homes#home_page"

  get 'assign_role', to: 'homes#assign_role'
  post 'assign_role', to: "homes#create_user"

  resources :shops do
    resources :products
  end

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
