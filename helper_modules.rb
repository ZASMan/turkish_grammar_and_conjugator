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

  def last_letter_unvoiced?
    unvoiced = %w[k ç p t]
    unvoiced.include?(@last_letter)
  end

  def noun_without_last_letter
    return @noun[0..(@noun.length-2)]
  end

  def modify_kg_mutation
    # Irregular because nğ would be unpronouncable
    letter_preceeding_k = noun_without_last_letter.split("").last
    if letter_preceeding_k == "n"
      noun_without_last_letter + "g"
    else
      noun_without_last_letter + "ğ"
    end
  end

  def modify_pb_mutation
    noun_without_last_letter + "b"
  end

  def modify_cc_mutation
    noun_without_last_letter + "c"
  end

  def modify_td_mutation
    noun_without_last_letter + "d"
  end

  def mutate_consonants_if_necessary
    if last_letter_unvoiced?
      return modify_kg_mutation if @last_letter == "k"
      return modify_pb_mutation if @last_letter == "p"
      return modify_cc_mutation if @last_letter == "ç"
      return modify_td_mutation if @last_letter == "t"
    else
      return @noun
    end
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