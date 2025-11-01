class PagesController < ApplicationController
  def top4
    @coders = Coder.in_organisation
                   .extending(CommitStats).with_commit_stats
                   .where(commits: { committed_at: 1.week.ago.. })
                   .order(score: :desc)
                   .limit(4)

    respond_to do |format|
      format.json do
        render json: @coders.map { %i[github_name score avatar_url github_url].index_with(it) }
      end
      format.html
    end
  end
end
