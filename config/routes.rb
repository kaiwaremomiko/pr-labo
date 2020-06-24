Rails.application.routes.draw do
  get    '/top', to: 'top#index'
  get    '/thanks', to: 'static_pages#thanks'
  post '/mailcompany', to: 'companies#mail', as: :companymail;
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
