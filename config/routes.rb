Rails.application.routes.draw do
  devise_for :users
  get 'feedbacks/new'
  root 'welcome#index'

  get '/about', to: 'welcome#about'
  get '/contact', to: 'welcome#contact'

  resources :feedbacks do
    resources :notes, except: [:index, :show]
  end

  resources :posts do
    resources :comments, except: :show
  end

  resources :categories, except: :show

  resources :remarks, except: :show
end
