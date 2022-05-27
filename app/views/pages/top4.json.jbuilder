json.array!(@coders) do |coder|
  json.extract! coder, :github_name, :score, :avatar_url
end
