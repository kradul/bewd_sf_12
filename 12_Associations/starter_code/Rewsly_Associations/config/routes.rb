Rewsly::Application.routes.draw do
  root 'stories#index'
  resources :stories do
    resources :comments, only: :create
  end
end
