class Record < ActiveRecord::Base
  belongs_to :user

  TYPE_0 = 0 #浏览
  TYPE_1 = 1 #中翻译日
  TYPE_2 = 2 #日翻译中
  TYPE_3 = 3 #测读音

  TYPE_HASH = {
      TYPE_0.to_s => "浏览",
      TYPE_1.to_s => "中翻译日",
      TYPE_2.to_s => "日翻译中",
      TYPE_3.to_s => "测读音",
  }

  def get_word_course
    self.local_word.split("_")[1]
  end

  def get_word_book
    self.local_word.split("_")[0]
  end

  def get_sentence_course
    self.local_sentence.split("_")[1]
  end

  def get_sentence_book
    self.local_sentence.split("_")[0]
  end

  def get_word
    self.local_word.blank?? false:true
  end

  def get_sentence
    self.local_sentence.blank?? false:true
  end

  def get_word_type
    TYPE_HASH[self.word_times.to_s]
  end

  def get_sentence_type
    TYPE_HASH[self.sentence_times.to_s]
  end
end
