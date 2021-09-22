Rails.application.routes.draw do
  root "energy_meters#index"

  resources :energy_meters do
    resources :energy_usages, except: [:index, :show]
  end
end
