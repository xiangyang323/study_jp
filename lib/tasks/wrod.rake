namespace :init do

  desc "读word文件到word表中"
  task :word => :environment do |task|
    local = "1_6"

    p "word start->#{Time.now.to_s(:db)}"
    if File.exist?("doc/words/#{local}.txt")
      lines = IO.readlines("doc/words/#{local}.txt")
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
        hash[:location] = local
        Word.create(hash) if !hash[:kana].blank?
      end  
    end
    p "word end->#{Time.now.to_s(:db)}"
  end
end  
