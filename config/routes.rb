Rails.application.routes.draw do
  resources :contracts do
    get 'accept', on: :member
  end
  devise_for :users
  root 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
