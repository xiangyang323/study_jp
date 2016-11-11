class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :user_id, comment: "关联user表"
      t.string  :local_word, limit: 50, comment: "单词到第几课"
      t.string  :local_sentence, limit: 50, comment: "句子到第几课"
      t.integer :word_count, comment: "单词背了几个"
      t.integer :sentence_count, comment: "句子背了几个"
      t.integer :word_times, comment: "改为单词学习种类 浏览,中译日,日译中,测读音"
      t.integer :sentence_times, comment: "改为单词学习种类 浏览,中译日,日译中"
      t.date :date
      t.timestamps
    end
  end
end
