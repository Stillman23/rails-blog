Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'
  get 'about' => 'users#about'
  get 'portfolio' => 'users#portfolio'
  get 'contact' => 'users#contact'
  post 'send_message' => 'users#send_message'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'download_pdf', to: 'users#download_pdf', as: 'resume'
  resources :posts do
    resources :comments
  end

  resources :comments
  resources :sessions
  resources :portfolios
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
