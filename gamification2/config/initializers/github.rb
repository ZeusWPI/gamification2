Rails.application.configure do
  config.github = Github.new(
    oauth_token: Rails.application.credentials.github_oauth_token,
    auto_pagination: true
  )
end
