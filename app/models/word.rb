class Word < ActiveRecord::Base
  has_many :word_r_categories

 
  #classify
  CLASSIFY_N = "n"  #none
  CLASSIFY_PRO = "pro" #pronone
  CLASSIFY_ADE = "ade" #adverbial
  CLASSIFY = Hash[CLASSIFY_N, "名词", CLASSIFY_PRO, "代词", CLASSIFY_ADE, "副词"]

  LOCAL_1_1 = "1_1"
  
end
