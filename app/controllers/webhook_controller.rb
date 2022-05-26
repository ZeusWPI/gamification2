class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    event = request.headers['X-GitHub-Event']
    return head :bad_request if event.blank?
    return head :ok unless event == 'push'

    repo_data = data['repository']
    return head :ok unless repo_data['owner']['login'] == Rails.application.config.organisation
    return head :ok if repo_data['private']

    Repository.create_or_update_from_github_api(name: repo_data['name'], github_url: repo_data['html_url'], clone_url: repo_data['clone_url'])

    head :ok
  end
end
