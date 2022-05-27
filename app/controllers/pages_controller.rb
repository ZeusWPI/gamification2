class PagesController < ApplicationController
  def scoreboard
    @sort_column = params[:order_by]
    @sort_column = 'score' unless %w[score commit_count additions deletions repository_count].include?(@sort_column)
    @coders = Coder.extending(CommitStats).with_commit_stats.with_repository_count.order({ @sort_column => :desc })
  end

  def top4
    @coders = Coder.extending(CommitStats).with_commit_stats
                   .where(commits: { committed_at: 1.week.ago.. })
                   .order(score: :desc)
                   .limit(4)

    @repos = Repository.extending(CommitStats).with_commit_stats
                       .where(commits: { committed_at: 1.week.ago.. })
                       .order(score: :desc)
                       .take(4).map do |repo|
      [
        repo,
        Coder.extending(CommitStats).with_commit_stats
             .where(repositories: { id: repo.id }, commits: { committed_at: 1.week.ago.. })
             .order(score: :desc)
      ]
    end
  end
end
