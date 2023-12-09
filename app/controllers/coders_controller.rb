class CodersController < ApplicationController
  def index
    @sort_column = params[:order_by]
    @sort_column = 'score' unless %w[score commit_count additions deletions repository_count].include?(@sort_column)
    @coders = Coder.in_organisation.extending(CommitStats).with_commit_stats.with_repository_count.order({ @sort_column => :desc })
  end

  def show
    @coder = Coder.in_organisation
                  .extending(CommitStats)
                  .with_commit_stats
                  .with_repository_count
                  .find(params[:id])

    @sort_column = params[:order_by]
    @sort_column = 'score' unless %w[score commit_count additions deletions].include?(@sort_column)
    @repositories = Repository.extending(CommitStats)
                              .with_commit_stats
                              .where(commits: { coder_id: @coder.id })
                              .order({ @sort_column => :desc })
  end
end
