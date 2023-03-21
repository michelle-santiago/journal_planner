Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/categories' => 'categories#index'
  # get '/categories/new' => 'categories#new', as: 'categories_new'
  root "home#index"

  resources :categories do
    resources :tasks
  end
end
