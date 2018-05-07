module PluralEndings
  LAR_ENDINGS = %w[a ı o u]
  LER_ENDINGS = %w[e i ö ü]
end

module Vowels
  VOWEL_LIST = %w[a e ı i o ö u ü]
  # Vowel Harmony guide here: https://turkishteatime.com/turkish-grammar-guide/vowel-harmony/
  E_TYPE_VOWEL_HARMONY_RULES = {
    "a": %w[a ı o u],
    "e": %w[e i ö ü]
  }
  ALL_E_TYPE = E_TYPE_VOWEL_HARMONY_RULES.values.flatten
  I_TYPE_VOWEL_HARMONY_RULES = {
    "i": %w[e i],
    "ı": %w[a ı],
    "u": %w[o u],
    "ü": %w[ö ü]
  }
end

module Consonants
  CONSONANT_LIST = %w[b c ç d f g ğ h j k l m n p r s ş t v y z]
  VOICELESS_CONSONANTS = %w[ç k t p s f h ş]
  VOICED_CONSONANTS = %w[c g d b z v ğ j l m n r y]
end

module CaseEndings
  LOCATIVE_ENDINGS = %w[de da te ta]
end

module HarmonyComparisons
  include Vowels
  include Consonants
  include CaseEndings
  include PluralEndings
  include CaseEndings

  # Vowel and consonant harmony helpers

  def last_letter_k?
    @last_letter == "k"
  end

  def last_letter_vowel?
    VOWEL_LIST.include?(@last_letter )
  end

  def last_letter_voiced_consonant?
    VOICED_CONSONANTS.include?(@last_letter )
  end

  def last_letter_voiceless_consonant?
    VOICELESS_CONSONANTS.include?(@last_letter)
  end

  def ea_harmony?
    E_TYPE_VOWEL_HARMONY_RULES[:a].include?(@last_vowel)
  end

  def ee_harmony?
    E_TYPE_VOWEL_HARMONY_RULES[:e].include?(@last_vowel)
  end

  def iuu_harmony?
    I_TYPE_VOWEL_HARMONY_RULES[:ü].include?(@last_vowel)
  end

  def iu_harmony?
    I_TYPE_VOWEL_HARMONY_RULES[:u].include?(@last_vowel)
  end

  # Plural Endings

  def lar_ending?
    LAR_ENDINGS.include?(@last_vowel)
  end

  def ler_ending?
    LER_ENDINGS.include?(@last_vowel)
  end
end