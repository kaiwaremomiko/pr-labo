Rails.application.routes.draw do
  get    '/top',   to: 'top#index'
  # post '/mail', to: 'top#mail', as: :mail;
  post '/mail', to: 'npos#mail', as: :mail;
  resources :articles
  resources :occupations
  resources :companies
  resources :npos
  get    '/postarticle',   to: 'postarticles#index'
  root to: 'home#index'
  get 'sitemap', to: redirect('https://prlabbacket.s3.us-east-2.amazonaws.com/sitemaps/sitemap.xml.gz')
  get 'sitemap2', to: redirect('https://s3-us-east-2.amazonaws.com/prlabbacket/sitemaps2/sitemap.xml.gz')
end
