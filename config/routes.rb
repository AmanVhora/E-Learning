Rails.application.routes.draw do
  root 'teacher_profiles#index'
  devise_for :teachers
  resources :teacher_profiles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
