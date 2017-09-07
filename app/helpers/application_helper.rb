module ApplicationHelper
	def avatar_for(user)
		require 'open-uri'
		require 'nokogiri'
		#debugger
		if user.avatar
			#debugger
			image_tag(user.avatar, alt: user.username, class: "img-circle")
		else
			
		page = Nokogiri::HTML(open("https://www.avatarapi.com/js.aspx?email=#{user.email}&size=128"))
		user.avatar = page.css("img").attr("src").value
		image_tag(user.avatar, alt: user.username, class: "img-circle")
		user.save
		end
	end
end
