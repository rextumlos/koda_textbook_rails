Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  get 'feedbacks/new'
  root 'welcome#index'

  get '/about', to: 'welcome#about'
  get '/contact', to: 'welcome#contact'

  constraints(ClientDomainConstraint.new) do
    resources :feedbacks do
      resources :notes, except: [:index, :show]
    end

    resources :posts do
      resources :comments, except: [:index, :show]
    end

    namespace :user do
      resources :posts, only: :index
    end
  end

  constraints(AdminDomainConstraint.new) do
    namespace :admin do
      resources :users, only: :index
      resources :categories, except: :show
      resources :remarks, except: :show
    end
  end

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

      resources :cities, only: [:index, :show], defaults: { format: :json } do
        resources :barangays, only: :index, defaults: { format: :json }
      end

      resources :barangays, only: [:index, :show], defaults: { format: :json }
    end
  end
end
