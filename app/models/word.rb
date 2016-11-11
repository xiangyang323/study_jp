class Word < ActiveRecord::Base
  has_many :word_r_categories

  scope :by_local, -> (local){
    where(location: local)
  }
 
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

  LOCAL_1 = ["1_1", "1_2", "1_3", "1_4", "1_5", "1_6", "1_7", "1_8", "1_9"]

  def get_course
    self.location.split("_")[1]
  end

  def get_book
    self.location.split("_")[0]
  end
  
end
