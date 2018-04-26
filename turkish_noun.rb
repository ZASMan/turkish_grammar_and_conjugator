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
  VOWEL_LIST = %w[a e ı i̇ o ö u ü]
end

module Consonants
  CONSONANT_LIST = %w[b c ç d f g ğ h j k l m n p r s ş t v y z]
end