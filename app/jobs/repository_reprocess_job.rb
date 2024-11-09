class RepositoryReprocessJob < ApplicationJob
  queue_as :default

  def perform(repository)
    OrganisationMember.create_all_from_organisation(repository.organisation)
    repository.pull_or_clone
    repository.process_commits
  end
end
