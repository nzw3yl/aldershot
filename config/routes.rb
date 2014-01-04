Demo4::Application.routes.draw do
  get "stucks/index"
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :priorities
  resources :stucks
  match 'team', to: 'home#team', via: :get
  match 'invitation', to: 'home#invitation', via: :get
  match 'completed/:id', to: 'priorities#completed', via: :patch, as: 'completed'
  match 'unstuck/:id', to: 'stucks#unstuck', via: :patch, as: 'unstuck'
  match 'urgency/:id', to: 'priorities#urgency', via: :patch, as: 'urgency'
  match 'blocks', to: 'stucks#blocks', via: :get
end