class CoursesController < ApplicationController
  def index
    @courses = Word::LOCAL_1.index(params[:id]) + 1
    return render_404 if @courses.blank?
    @words = Word.by_local(params[:id]).paginate(page: params[:page] ,per_page: 10)

    if request.xhr?
      respond_to do |format| # <- 这里
        format.html #这是默认请求的处理，渲染html(my_messages.html.erb)
        format.js # <- 这里是ajax请求处理，渲染js模板(my_messages.js.erb)
      end
    end
  end

  def exam
    @courses = Word::LOCAL_1.index(params[:id]) + 1
    return render_404 if @courses.blank?
  end
end
