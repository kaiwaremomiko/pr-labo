Rails.application.routes.draw do
  resources :occupations
  resources :companies
  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  root to: 'home#index'
  get 'sitemap', to: redirect('https://s3-us-east-2.amazonaws.com/prlabbacket/sitemaps/sitemap.xml.gz')
  resources :npos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
