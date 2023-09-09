module CommitStats
  def commit_stats_base
    scope = from('repositories INNER JOIN commits ON repositories.id = commits.repository_id INNER JOIN coders ON coders.id = commits.coder_id').group(:id).where(coders: { github_name: OrganisationMember.select(:github_name) })
    scope = scope.select("#{scope.table_name}.*") unless scope.select_values.any?
    scope
  end

  def with_commit_stats
    commit_stats_base.select(
      'SUM(commits.score) AS score',
      'COUNT(commits.id) AS commit_count',
      'SUM(commits.additions) AS additions',
      'SUM(commits.deletions) AS deletions'
    )
  end

  def with_repository_count
    commit_stats_base.select('COUNT(DISTINCT(repositories.id)) as repository_count')
  end

  def with_coder_count
    commit_stats_base.select('COUNT(DISTINCT(coders.id)) as coder_count')
  end
end
