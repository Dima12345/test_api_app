Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :employees, only: [:index, :show]
    resources :assignments, only: [:create, :update, :index, :show]
  end
end
