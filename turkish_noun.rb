require_relative 'helper_modules.rb'
require 'pry'

class TurkishNoun
  include Vowels
  include Consonants
  include PluralEndings

  attr_accessor :noun, :word_without_consonants, :last_vowel, :last_consonant

  def initialize(noun_infinitive)
    @noun = noun_infinitive.downcase
    @word_without_consonants = @noun.delete(CONSONANT_LIST.join(''))
    @last_vowel = @word_without_consonants[-1]
    # @last_consonant = 
  end

  # Cases
  # Needed when verb is transitive verb
  # Needed when object of the sentence is definite and specific
  def accusative_definite

  end
  
  # To, towards
  def dative

  end

  # At, on, in
  def locative

  end

  # From, out of, through
  def ablative

  end
  
  # Posessive, of / 's
  def genitive
 
  end

  # Plural

  def plural
    return self.noun + "lar" if LAR_ENDINGS.include?(@last_vowel)
    return self.noun + "ler" if LER_ENDINGS.include?(@last_vowel)
  end
end
