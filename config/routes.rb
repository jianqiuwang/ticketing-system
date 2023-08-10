Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/events', to: 'events#index'
  get "/me", to: "users#show"
  post "/signup", to: "users#create"
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  
end
