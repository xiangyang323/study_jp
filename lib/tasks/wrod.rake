namespace :init do

  desc "读word文件到word表中"
  task :word => :environment do |task|
    p "word start->#{Time.now.to_s(:db)}"
    if File.exist?("/Users/xiangyang/Desktop/word.txt")
      lines = IO.readlines("/Users/xiangyang/Desktop/word.txt")
      p lines.size
      lines.each do |line|
        line.gsub!("\n", "")
        hash = {}
        words = line.split("、")
        if words.size == 2
          hash[:kana] = words[0]
          hash[:word_jp] = words[0]
          hash[:word_ch] = words[1]
        elsif words.size == 3
          hash[:kana] = words[0]
          hash[:word_jp] = words[1]
          hash[:word_ch] = words[2]
        else
          p line  
        end
        hash[:location] = "1_2"
        Word.create(hash) if !hash[:kana].blank?
      end  
    end
    p "word end->#{Time.now.to_s(:db)}"
  end
end  
