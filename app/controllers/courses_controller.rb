class CoursesController < ApplicationController
  def index
    @courses = Word::LOCAL_1.index(params[:id]) + 1
    return render_404 if @courses.blank?
    per_page = 10
    if params[:type] == Record::TYPE_0.to_s
      per_page = 1
    end
    @words = Word.by_local(params[:id]).paginate(page: params[:page] ,per_page: per_page)

    if params[:type] == Record::TYPE_0.to_s && @words.total_entries == params[:page].to_i
      record = Record.find_or_create_by(date: Time.now.to_date, user_id: @user.id)
      record.update(local_word: params[:id], word_count: @words.total_entries, word_times: Record::TYPE_0)
    end

    if request.xhr?
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def exam
    @courses = Word::LOCAL_1.index(params[:id]) + 1
    @count = Word.by_local(params[:id]).count
    return render_404 if @courses.blank?
    @words = Word.where("location = ? and id not in (select word_id from #{UserWord.table_name} where do_type = ?)", params[:id], params[:type]).paginate(page: 1, per_page: 1)
    @word = @words.first

    if request.xhr?
      respond_to do |format|
        format.html
        format.js {render template: "courses/index"}
      end
    end
  end

  def recode_word
    user_id = 1
    word = Word.find(params[:word_id])
    return render json: {"status": false} if word.blank?
    user_word = UserWord.find_or_create_by(user_id: user_id, word_id: word.id, do_type: params[:type])
    user_word.count = 0 if user_word.count.blank?

    if params[:flag] == "true"
      user_word.count -= 1 if user_word.count > 0
      user_word.save
    elsif params[:flag] == "false"
      user_word.count += 1
      user_word.save
    end

    user_count = Word.where("location = ? and id not in (select word_id from #{UserWord.table_name} where do_type = ?)", params[:local], params[:local]).count
    count = Word.by_local(params[:local]).count
    if user_count == 0
      record = Record.find_or_create_by(date: Time.now.to_date, user_id: @user.id)
      record.update(local_word: params[:local], word_count: count, word_times: params[:type])
    end

    render json: {"status": true, "count": user_word.count}
  end

  def clear_course
    words = Word.by_local(params[:id])
    UserWord.delete_all(word_id: words, user_id: @user.id, do_type: params[:type])
    redirect_to controller: "courses", action: "index", id: params[:id]
  end
end
