Rails.application.routes.draw do
  get 'feedbacks/new'
  root 'welcome#index'

  get '/about', to: 'welcome#about'
  get '/contact', to: 'welcome#contact'

  resources :feedbacks

  resources :posts do
    resources :comments, except: :show
  end
  resources :categories, except: :show
end
