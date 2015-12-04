Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :questions do
    resources :answers
  end
  post "users/:id/activate", to: "users#activate", as: 'activate'
  root 'questions#index'
end
