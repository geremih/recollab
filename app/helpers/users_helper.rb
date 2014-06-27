module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image = image_tag(gravatar_url, alt: user.name, class: "gravatar meta_image")
    link_to image, user_path(user)

  end
end
