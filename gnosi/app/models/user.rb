class User < ActiveRecord::Base



	#MAKE TOKEN NUMBERS SECRET: DEFINE THEM IN .env FILE AND PLACE THEM HERE
	def self.create_new user
		user = User.create(
        uid: request.env['omniauth.auth']['uid'],
        family_name: request.env['omniauth.auth']['extra']['raw_info']['familyName'],
        given_name: request.env['omniauth.auth']['extra']['raw_info']['givenName'],
        email: request.env['omniauth.auth']['extra']['raw_info']['email'],
        picture: request.env['omniauth.auth']['extra']['raw_info']['picture'],
        auth_token: request.env['omniauth.auth']['credentials']['token'],
        refresh_token: request.env['omniauth.auth']['credentials']['refresh_token']
      )
		return user
	end

	def self.update_token user
		 user.update_attributes(auth_token: request.env['omniauth.auth']['credentials']['token'])
		 return user
	end

end
