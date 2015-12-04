Rails.application.routes.draw do
  devise_for :users
  resources :users, :questions
  post "users/:id/activate", to: "users#activate", as: 'activate'
  root 'static_pages#index'
end
