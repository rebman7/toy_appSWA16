module MicropostsHelper

	def owner?(micropost)
		logged_in? and current_user.id == micropost.user_id
	end
end
