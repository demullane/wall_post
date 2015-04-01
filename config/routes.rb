Rails.application.routes.draw do

  root 'home#index'
  post '/' => 'home#create'
  get '/upvote/:id' => 'home#upvote', as: :upvote

end
