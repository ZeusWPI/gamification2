# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

github = Rails.application.config.github
Rails.application.config.organisations.each do |org|
  repos = github.repos.list :all, org: org
  repos.each do |hash|
    next if hash['private']

    saved = Repository.create_or_update_from_github_api(hash['owner']['login'], hash['name'], hash['html_url'], hash['clone_url'])
    puts "Creating or updating #{hash['owner']['login']}/#{hash['name']}" if saved
  end
end
