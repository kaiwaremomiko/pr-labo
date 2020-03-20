Rails.application.routes.draw do
  resources :occupations
  resources :companies
  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  root to: 'home#index'
  get 'sitemap', to: redirect('https://prlabobacket.s3.amazonaws.com/sitemaps/sitemap.xml.gz')
  resources :npos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
