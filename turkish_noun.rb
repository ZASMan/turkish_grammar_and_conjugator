require_relative 'helper_modules.rb'
require 'pry'

class TurkishNoun
  include Vowels
  include Consonants
  include PluralEndings

  attr_accessor :noun, :plural_noun

  def initialize(noun_infinitive)
    @noun = noun_infinitive.downcase
  end

  # Possession

  def singular_posessive

  end

  def plural_posessive

  end

  # Cases

  def definite_accusative

  end

  def dative

  end

  def locative

  end

  def ablative

  end

  def genitive

  end

  # Plural

  def plural
    word_without_consonants = @noun.delete(CONSONANT_LIST.join(''))
    last_vowel = word_without_consonants[-1]
    return self.noun + "lar" if LAR_ENDINGS.include?(last_vowel)
    return self.noun + "ler" if LER_ENDINGS.include?(last_vowel)
  end
end
