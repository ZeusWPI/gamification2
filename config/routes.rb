Rails.application.routes.draw do
  resources :commits, only: %i[index show]
  resources :coders, only: %i[index show]
  resources :repositories, only: %i[index show]
end
