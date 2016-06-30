Rails.application.routes.draw do

  resources :search_suggestions
  get 'playlist/create'

  get 'playlist/destroy'

  root 'welcome#izzy_bam'
  get 'vj', to: 'welcome#vj'
  post 'playlists', to: 'welcome#create_playlist'

  post 'search', to: 'actions#search'
  get 'fallback_location', to: 'welcome#izzy_bam'

  # Auth0
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
