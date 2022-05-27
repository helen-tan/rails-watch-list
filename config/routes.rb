Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # User can see all the lists
  get "lists", to: "lists#index"

  # User can create a new list
  get "lists/new", to: "lists#new", as: :new_list
  post "lists", to: "lists#create"

  # User can see the details of a given list and its name
  get "lists/:id", to: "lists#show", as: :list

  # User can add a new bookmark (movie/list pair) to an existing list
  # GET lists/:id/bookmarks/new
  # POST lists/:id/bookmarks
  resources :lists, only: [:show] do
    resources :bookmarks, only: [:new, :create]
  end

  get "bookmarks/:id", to: "bookmarks#show", as: :bookmark

  # User can delete a bookmark from a list
  # DELETE bookmarks/:id
  delete "bookmarks/:id", to: "bookmarks#destroy"
end
