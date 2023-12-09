class PagesController < ApplicationController
  def top4
    @coders = Coder.in_organisation
                   .extending(CommitStats).with_commit_stats
                   .where(commits: { committed_at: 1.week.ago.. })
                   .order(score: :desc)
                   .limit(4)

    @repos = Repository.extending(CommitStats).with_commit_stats
                       .where(commits: { committed_at: 1.week.ago.. })
                       .order(score: :desc)
                       .take(4).map do |repo|
      [
        repo,
        Coder.in_organisation
             .extending(CommitStats).with_commit_stats
             .where(repositories: { id: repo.id }, commits: { committed_at: 1.week.ago.. })
             .order(score: :desc)
      ]
    end
  end
end
