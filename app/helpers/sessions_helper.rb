module SessionsHelper

	# Logs in the given user.
	def log_in(user)
		session[:user_id] = user.id
	end

	# Logs out the current user.
	def log_out
		reset_session
		@current_user = nil
	end


	# Reset the session value for logged user.
	def reset_session
		session.delete(:user_id)
		@current_user = nil
	end

	# Returns the current logged-in user (if any).
	def current_user
		if @current_user.nil?
			@current_user = User.find_by(id: session[:user_id])
		else
			@current_user
		end
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end
end
