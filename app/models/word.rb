class Word < ActiveRecord::Base
  has_many :word_r_categories

  #classify
  CLASSIFY = Hash
end
