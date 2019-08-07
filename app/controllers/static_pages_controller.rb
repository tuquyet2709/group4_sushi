class StaticPagesController < ApplicationController
  def home 
    @top_high_salary_works = Work.order(:salary).last(2)
    @top_recent_works = Work.order(:dateline).last(4)
  end

  def help
  end

end
