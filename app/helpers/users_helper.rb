module UsersHelper

  # 引数で与えられたユーザーのGravatar画像を返す（今回は使わない）
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.name.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
