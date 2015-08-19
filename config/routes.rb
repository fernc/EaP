Rails.application.routes.draw do
	root 'static#home'

	get '/about' => 'static#about'
	get '/services' => 'static#services'

	match '/contact', to: 'contacts#new', via: 'get'
	resources 'contacts', only: [:new, :create]

	match '/join_us', to: 'tutors#new', via: 'get'
	resources 'tutors', only: [:create]
end
