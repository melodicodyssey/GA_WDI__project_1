class SessionsController < ApplicationController
  def new
  end

# map post '/' to sessions#create

  def create
	user = User.find_by_email(params[:session][:email])
	if user.authenticate(params[:session][:password])
		sign_in user
		flash[:message] = "Successfully logged in!"
		redirect_to feed_path(user.id)
	else
		flash[:error] = "Your email or password is invalid"
		redirect_to signin_path
	end
  end

  def destroy
	sign_out
	redirect_to index_path
  end
end
