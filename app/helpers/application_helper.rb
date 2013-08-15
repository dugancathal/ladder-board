module ApplicationHelper
  def unicornify_avatar_url(email)
    "http://unicornify.appspot.com/avatar/#{digest_email(email)}?s=100"
  end

  def gravatar_avatar_url(email)
    "http://gravatar.com/avatar/#{digest_email(email)}?s=100"
  end

  def identicon_avatar_url(email)
    username = email.split('@').first
    "https://identicons.github.com/#{username}.png"
  end

  def digest_email(email)
    Digest::MD5.hexdigest email
  end
end
