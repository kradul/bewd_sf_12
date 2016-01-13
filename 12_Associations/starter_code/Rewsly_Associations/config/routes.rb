Rewsly::Application.routes.draw do
  get "category/show"
  root 'stories#index'
  resources :stories do
    resources :comments, only: :create #if two resources are closely related, then u can nest url structure.
  end
end
