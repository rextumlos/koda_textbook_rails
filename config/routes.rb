Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  get 'feedbacks/new'
  root 'welcome#index'

  get '/about', to: 'welcome#about'
  get '/contact', to: 'welcome#contact'

  resources :feedbacks do
    resources :notes, except: [:index, :show]
  end

  resources :posts do
    resources :comments, except: [:index, :show]
  end

  resources :categories, except: :show

  resources :remarks, except: :show

  namespace :api do
    resources :news, only: :index
    resources :catfacts, only: :create
  end
end
