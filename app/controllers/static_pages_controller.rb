class StaticPagesController < ApplicationController
  before_action :set_search
  def home 
    @top_high_salary_works = Work.order(:salary).last(2)
    @top_recent_works = Work.order(:dateline).last(4)

    if params[:q].present?
      @q = Work.search(params[:q])
      @works = @q.result(distinct: true).page(params[:page]).per 7
    else
      @works = Work.all.page(params[:page]).per 7
    end
  end

  def help
  end

end
