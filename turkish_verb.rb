require_relative 'helper_modules.rb'
require 'pry'

class TurkishVerb
  include AllTurkishGrammarHelpers

  attr_accessor :verb, :verb_stem

  def initialize(verb_infinitive)
    @verb = verb_infinitive.downcase
    @verb_stem = @verb[0..-4]
  end

  def definite_past_tense
    {
      ben: "",
      sen: "",
      o: "",
      siz: "",
      biz: "",
      onlar: ""
    }
  end
end