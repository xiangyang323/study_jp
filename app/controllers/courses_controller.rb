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
    @words = Word.by_local(params[:id]).paginate(page: params[:page] ,per_page: 1)
    @word = @words.first
    return render_404 if @courses.blank?
    if request.xhr?
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def recode_word
    user_id = 1
    word = Word.find(params[:word_id])
    return render json: {"status": false} if word.blank?
    user_word = UserWord.find_or_create_by(user_id: user_id, word_id: word.id)
    user_word.count = 0 if user_word.count.blank?
    if params[:flag] == "true"
      user_word.count -= 1 if user_word.count > 0
      user_word.save
    elsif params[:flag] == "false"
      user_word.count += 1
      user_word.save
    end
    render json: {"status": true, "count": user_word.count}
  end
end
