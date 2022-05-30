Rails.application.routes.draw do
  root 'pages#top4'
  get 'top4', to: 'pages#top4'
  post 'webhook', to: 'webhook#receive'
  resources :coders, only: %i[index show]
  resources :repositories, only: %i[index show], id: %r{[^/]+}
end
