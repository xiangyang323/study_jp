namespace :init do

  desc "读word文件到word表中"
  task :word => :environment do |task|
    local = "1_7"

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

  desc "读取mp3文件"
  task :read_mp3 => :environment do |task|
    p "read_mp3 start->#{Time.now.to_s(:db)}"


    p "read_mp3 end->#{Time.now.to_s(:db)}"
  end

  task :verb => :environment do |task|
    p "verb start->#{Time.now.to_s(:db)}"
    path = "doc/verb/verb_01.txt"
    if File.exist?(path)
      lines = IO.readlines(path)
      p lines.size
      lines.each do |line|
        line.gsub!("\n", "")
        break if line.blank?
        hash = {}
        words = line.split("、")

        if !words.size == 3
          p "1111111"
          p line
        end
        # common = words[1].gsub(words[1][0], "")
        # common_ka = words[0].gsub(common, "")
        # p common_ka
        # p common

        hash[:kana] = "#{words[0].gsub("します", "する")}"
        hash[:word_jp] = words[1]
        hash[:classify] = Word::CLASSIFY_V1
        hash[:location] = "1_#{words[2]}"
        p hash
        word = Word.create(hash)
        # p word
        verb_hash = {}
        verb_hash[:word_id] = word.id
        verb_hash[:ma_type] = words[0]
        verb_hash[:te_type] = "#{words[0].gsub("ます", "て")}"
        verb_hash[:na_type] = "#{words[0].gsub("ます", "ない")}"
        verb_hash[:ta_type] = "#{words[0].gsub("ます", "た")}"
        VerbType.create(verb_hash)

        # p verb_hash
        # break
        # if words.size == 2
        #   hash[:kana] = words[0]
        #   hash[:word_jp] = words[0]
        #   hash[:word_ch] = words[1]
        # elsif words.size == 3
        #   hash[:kana] = words[0]
        #   hash[:word_jp] = words[1]
        #   hash[:word_ch] = words[2]
        # else
        #   p line
        # end
        # hash[:location] = local
        # Word.create(hash) if !hash[:kana].blank?
      end
    end
    p "verb end->#{Time.now.to_s(:db)}"
  end
end  
