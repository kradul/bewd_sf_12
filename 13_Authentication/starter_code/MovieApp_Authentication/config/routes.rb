MoviesApp::Application.routes.draw do
  get "actor/show"
  get "genre/show"
  root "movies#index"
  resources :movies

  resources :genres
  resources :actors
end
