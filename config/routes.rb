Demo4::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  match 'main', to: 'home#main', via: :get
  match 'team', to: 'home#team', via: :get
  match 'invitation', to: 'home#invitation', via: :get
end