require 'active_record'

class Word < ActiveRecord::Base
  before_save :normalize_word 

  def self.anagram(input)
    permutation_array = input.split("").permutation.map { |x|  x.join('') }
    @match_words = Word.where(:word => permutation_array)
  end

  def normalize_word
    self.anagram_string = self.word.downcase.split(//).sort.join
  end

  def self.anagrams_for(word)
    unless word.is_a? Word
      word = new(:word => word.to_s)
      word.normalize_word
    end

    where(:anagram_string => word.anagram_string)
  end
end

