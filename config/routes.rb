LadderBoard::Application.routes.draw do
  get "pages/about"
  root to: 'games#index'
  resources :games
end
