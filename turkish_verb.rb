require_relative 'helper_modules.rb'
require 'pry'

class TurkishVerb
  include AllTurkishGrammarHelpers
  include VerbConjugations

  attr_accessor :verb, :verb_stem

  def initialize(verb_infinitive)
    @verb = verb_infinitive.downcase
    @word_without_consonants = @verb.delete(CONSONANT_LIST.join(''))
    @word_without_vowels = @verb.delete(VOWEL_LIST.join(''))
    @verb_stem = @verb[0..-4]
    @last_vowel = @word_without_consonants[-1]
    @last_consonant = @word_without_vowels[-1]
    @last_letter = @verb_stem.split("").last
  end

  def definite_past_tense
    {
      ben: @verb_stem + definite_past_ending("ben"),
      sen: @verb_stem + definite_past_ending("sen"),
      o: @verb_stem + definite_past_ending("o"),
      siz: @verb_stem + definite_past_ending("siz"),
      biz: @verb_stem + definite_past_ending("biz"),
      onlar: @verb_stem + definite_past_ending("onlar")
    }
  end
end