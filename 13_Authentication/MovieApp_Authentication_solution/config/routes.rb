MoviesApp::Application.routes.draw do
  devise_for :users
  get "actor/show"
  get "genre/show"
  root "movies#index"
  resources :movies

  resources :genres
  resources :actors

  #show_user_movies_url(id: user_id)
  get 'users/show_movies' => 'users#show_movies', as: :show_user_movies
  get 'users/add_movie/:id' => 'users#add_movie', as: :add_movie
  get 'users/remove_movie/:id' => 'users#remove_movie', as: :remove_movie

end
