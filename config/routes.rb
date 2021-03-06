Rails.application.routes.draw do
  resources :contracts do
    get 'accept', on: :member
    get 'finish', on: :member
    get 'make_rating', on: :member
    post 'rating', on: :member
    patch 'rating', on: :member
  end
  devise_for :users
  root 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
