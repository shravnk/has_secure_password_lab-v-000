class SessionsController < ApplicationController
	def new
	end

	def create
		 if @user = User.find_by(name: params[:user][:name])
		 	if @user.authenticate(params[:user][:password])
				session[:user_id] = @user.id
				redirect_to welcome_path
			else
				redirect_to login_path
			end
		else
			redirect_to login_path
		end
	end

	private

	def session_params
		params.require(:user).permit(:name, :password)
	end
end