module UsersHelper
	def gravatar_for(user, options = {size: 50})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "http://www.gravatar.com/avatar/#{hash}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
end
