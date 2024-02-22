require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  mount Sidekiq::Web => '/sidekiq'

  get '/', to: 'blog_posts#index', as: 'root'
  get '/blog/new', to: 'blog_posts#new', as: :new_blog_post
  get '/blog/:id', to: 'blog_posts#show', as: :blog_post
  patch '/blog/:id', to: 'blog_posts#update'
  delete '/blog_post/:id', to: 'blog_post#destroy'
  get '/blog/:id/edit', to: 'blog_posts#edit', as: :edit_blog_post

  post '/blog/create', to: 'blog_posts#create', as: :blog_posts



  # Defines the root path route ("/")
  # root "posts#index"
end
