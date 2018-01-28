Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end 
  resources :comments
  
  get 'welcome/index'
  root 'welcome#index'

  get 'welcome/about'
  root 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
