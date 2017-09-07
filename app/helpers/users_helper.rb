module UsersHelper
	include HTTParty
		def localization(ip)
			loc = HTTParty.get('https://freegeoip.net/json/192.0.0.1')
		end
end
