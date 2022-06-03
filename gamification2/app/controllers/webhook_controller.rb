class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    event = request.headers['X-GitHub-Event']
    return head :bad_request if event.blank?
    return head :ok unless event == 'push'

    repo_data = request.params['repository']
    return head :ok unless repo_data['owner']['login'] == Rails.application.config.organisation
    return head :ok if repo_data['private']

    Repository.create_or_update_from_github_api(repo_data['name'], repo_data['html_url'], repo_data['clone_url'])

    head :ok
  end
end
