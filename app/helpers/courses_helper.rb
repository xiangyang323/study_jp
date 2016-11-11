module CoursesHelper

  def exam_title(type)
    case type
      when "jp"
        "中翻译日"
      when "read"
        "测试读音"
    end
  end
end
