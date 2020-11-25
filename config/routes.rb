Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "recipes#index"
  resources :users, only: :show
  resources :recipes, except: :index do
    collection do
      get 'search'
    end
  end
end
