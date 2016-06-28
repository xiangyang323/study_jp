class Word < ActiveRecord::Base
  has_many :word_r_categories

 
  #classify
  CLASSIFY_N = "n"  #none
  CLASSIFY_PRO = "pro" #pronone
  CLASSIFY_ADE = "ade" #adverbial
  CLASSIFY_INTERROG = "interrog" #Interrogative
  CLASSIFY_CONJ = "conj" #conjunction
  CLASSIFY_V1 = "v1"
  CLASSIFY_V2 = "v2"
  CLASSIFY_V3 = "v3"
  CLASSIFY = Hash[CLASSIFY_N, "名词", CLASSIFY_PRO, "代词", CLASSIFY_ADE, "副词",
  	CLASSIFY_INTERROG, "疑问词", CLASSIFY_CONJ, "连词",
  	CLASSIFY_V1, "动1", CLASSIFY_V2, "动2", CLASSIFY_V3, "动3"]

  #local
  LOCAL_1_1 = "1_1"
  LOCAL_1_2 = "1_2"
  LOCAL_1_3 = "1_3"
  LOCAL_1_4 = "1_4"
  
end
