Gnosi::Application.routes.draw do

	resources :users, :sessions, :gnosis

	# root to: 'gnosis#index', as: :index
	
	get '/', to: 'gnosis#index', as: :index

	get '/auth/feedly/callback', to: 'sessions#create'

	get '/signup', to: 'users#new', as: :signup
	get '/signin', to: 'sessions#new', as: :signin
	get '/signout', to: 'sessions#destroy', as: :signout	
	post '/sessions/', to: 'sessions#create', as: :create_session
	get '/gnosi/feed/:id', to: 'gnosis#feed', as: :feed
	get '/gnosi/history/:id', to: 'gnosis#history', as: :history
	


end
