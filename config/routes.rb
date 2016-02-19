Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  resources :users
  resources :questions do
    resources :answers
  end
  resources :categories

  post "users/:id/activate", to: "users#activate", as: 'activate'
  root 'static_pages#index'
  get '/position', to: 'geo#show'

end
