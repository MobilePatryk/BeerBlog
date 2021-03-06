module ApplicationHelper
	def avatar_for(user, options = {size: 20})
		require 'open-uri'
		require 'nokogiri'
		#debugger
		if user.avatar
			#debugger
			image_tag(user.avatar, alt: user.username, class: "img-circle")
		else
			page = Nokogiri::HTML(open("https://www.avatarapi.com/js.aspx?email=#{user.email}&size=128"))
			#debugger
			user.avatar = unless page.css("img").empty?
			page.css("img").attr("src").value
		else
			"https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Beer_mug.svg/1024px-Beer_mug.svg.png"
		end
			user.save
			image_tag(user.avatar, alt: user.username, class: "img-circle", size: 20, id: "avatar")
		end
	end
end
