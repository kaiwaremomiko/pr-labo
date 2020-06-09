Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/create'
  resources :articles
  resources :occupations
  resources :companies
  get    '/postarticle',   to: 'postarticles#index'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  root to: 'home#index'
  # get 'sitemap1', to: redirect('https://s3-us-east-2.amazonaws.com/prlabbacket/sitemaps/sitemap1.xml.gz')
  # get 'sitemap2', to: redirect('https://s3-us-east-2.amazonaws.com/prlabbacket/sitemaps/sitemap2.xml.gz')
  get 'sitemap', to: redirect('https://prlabbacket.s3.us-east-2.amazonaws.com/sitemaps/sitemap.xml.gz')
  get 'sitemap2', to: redirect('https://s3-us-east-2.amazonaws.com/prlabbacket/sitemaps2/sitemap.xml.gz')
  resources :npos
  post '/mail', to: 'npos#mail', as: :mail
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
