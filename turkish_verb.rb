require_relative 'helper_modules.rb'
require 'pry'

class TurkishVerb
  include HarmonyComparisons

  attr_accessor :verb, :verb_stem

  def initialize(verb_infinitive)
    @verb = verb_infinitive.downcase
    @verb_stem = @verb[0..-4]
  end
end