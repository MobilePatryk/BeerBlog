module ApplicationHelper
	def avatar_for(user)
		#debugger
		if user.avatar
			debugger
			image_tag(user.avatar, alt: user.username, class: "img-circle")
		else
		user.avatar = "https://unsplash.it/200/300/?random"
		image_tag(user.avatar, alt: user.username, class: "img-circle")
		user.save
		end
	end
end
