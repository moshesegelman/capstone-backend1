Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"
 
    get "/subjects" => "subjects#index"
    get "/subjects/:id" => "subjects#show"
    # post "/subjects" => "subjects#create"
    # patch "/subjects/:id" => "subjects#update"
    # delete "/subjects/:id" => "subjects#destroy"
     
    # get "/channels" => "channels#index"
    get "/channels/:id" => "channels#show"
    post "/channels" => "channels#create"
    patch "/channels/:id" => "channels#update"
    delete "/channels/:id" => "channels#destroy"
 
    # get "/messages" => "messages#index"
    get "/messages/:id" => "messages#show"
    post "/messages" => "messages#create"
    # patch "/messages/:id" => "messages#update"
    delete "/messages/:id" => "messages#destroy"
 
    get "/conversations" => "conversations#index"
    get "/conversations/:id" => "conversations#show"
    post "/conversations" => "conversations#create"
     # patch "/conversations/:id" => "conversations#update"
    delete "/conversations/:id" => "conversations#destroy"

    get "/friends" => "friends#index"
    # get "/friends/:id" => "friends#show"
    post "/friends" => "friends#create"
    patch "/friends/:id" => "friends#update"
    delete "/friends/:id" => "friends#destroy"
  
 
    post "/sessions" => "sessions#create"
  end
end
