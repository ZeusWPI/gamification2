Rails.application.routes.draw do
  root 'pages#top4'
  get 'top4', to: 'pages#top4'
  get 'scoreboard', to: 'pages#scoreboard'
  post 'webhook', to: 'webhook#receive'
  resources :coders, only: %i[show]
  resources :repositories, only: %i[index show]
end
