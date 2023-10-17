Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
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

    namespace :v1 do
      resources :regions, only: [:index, :show], defaults: { format: :json } do
        resources :provinces, only: :index, defaults: { format: :json }
      end

      resources :provinces, only: [:index, :show], defaults: { format: :json } do
        resources :cities, only: :index, defaults: { format: :json }
      end

      resources :cities, only: [:index, :show], defaults: { format: :json }
    end
  end
end
