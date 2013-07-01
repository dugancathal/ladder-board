GoogleAnalyticsTest::Application.routes.draw do
  get "leaders" => "leaders#index", as: "leaders"
  root to: 'games#index'
  resources :games
end
