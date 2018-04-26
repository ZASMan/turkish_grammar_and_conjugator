class TurkishNoun
  include Vowels
  include Consonants

  def initialize(noun_infinitive)
    @noun = noun
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

  end
end

module Vowels
  VOWEL_LIST = %w[]
end

module Consonants
  CONSONANT_LIST = %w[]
end