module UsersHelper
	include HTTParty
		def localization(ip)
			base_uri = 'https://freegeoip.net/json/'
			path = ip.to_s
			loc = HTTParty.get(base_uri+path)
		end
end
