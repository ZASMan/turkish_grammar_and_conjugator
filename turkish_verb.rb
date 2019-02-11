require_relative 'helper_modules.rb'
require 'pry'

class TurkishVerb
  include AllTurkishGrammarHelpers
  include VerbConjugations

  attr_accessor :verb, :verb_stem

  def initialize(verb_infinitive)
    @verb = verb_infinitive.downcase
    @verb_stem = @verb[0..-4]
    @word_without_consonants = @verb_stem.delete(CONSONANT_LIST.join(''))
    @word_without_vowels = @verb_stem.delete(VOWEL_LIST.join(''))
    @last_vowel = @word_without_consonants[-1]
    @last_consonant = @word_without_vowels[-1]
    @last_letter = @verb_stem.split("").last
    @pronoun_array = %i[ben sen o siz biz onlar]
  end

  def present_simple_tense
    present_simple_tense_values = @pronoun_array.collect { |pronoun| @verb_stem + present_simple_ending(pronoun.to_s) }
    present_simple_tense_hash = @pronoun_array.zip(present_simple_tense_values).to_h
    return present_simple_tense_hash
  end

  def present_continuous_tense
    present_continous_tense_values = @pronoun_array.collect { |pronoun| @verb_stem + present_continuous_ending(pronoun.to_s) }
    present_continuous_tense_hash = @pronoun_array.zip(present_continous_tense_values).to_h
    return present_continuous_tense_hash
  end

  def definite_past_tense
    definite_past_tense_values = @pronoun_array.collect { |pronoun| @verb_stem + definite_past_ending(pronoun.to_s) }
    definite_past_tense_hash = @pronoun_array.zip(definite_past_tense_values).to_h
    return definite_past_tense_hash
  end
end