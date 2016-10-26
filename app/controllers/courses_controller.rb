class CoursesController < ApplicationController
  def index
    @courses = Word::LOCAL_1.index(params[:id]) + 1
    return render_404 if @courses.blank?
    @words = Word.by_local(params[:id]).paginate(page: params[:page] ,per_page: 10)

    if request.xhr?
      p "111111"
    end
  end
end
