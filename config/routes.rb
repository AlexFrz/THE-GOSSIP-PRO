Rails.application.routes.draw do
  root 'gossips#index'

  resources :gossips

  get 'user/:id', to: 'front#user', as: 'user'
  get 'team', to: 'front#team'
  get 'contact', to: 'front#contact'
  get 'welcome/:first_name', to: 'front#welcome'
end
