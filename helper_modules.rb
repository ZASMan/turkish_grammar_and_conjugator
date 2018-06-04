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

module PosessiveEndings
  # http://www.turkishlanguage.co.uk/possadj.htm
  
  def last_vowel_for_posessive
    return "i" if @last_vowel == "e"
    return "ü" if @last_vowel == "ö"
    return "ı" if @last_vowel == "a"
  end

  def last_vowel_for_o_siz_biz_ending
    return "ı" if @last_vowel == "a"
    return "i" if @last_vowel == "e"
    return "ü" if @last_vowel == "ö"
    return @last_vowel
  end

  def ben_ending
    return "m" if last_letter_vowel?
    return last_vowel_for_posessive + "m"
  end

  def sen_ending
    # ‑ın ‑in ‑un ‑ün
    # After vowels: -n
    return "n" if last_letter_vowel?
    return last_vowel_for_posessive + "n"
  end

  def o_ending
    # ‑ı ‑i ‑u ‑ü
    # After vowels: ‑sı ‑si ‑su‑ ‑sü
    return "s" + last_vowel_for_o_siz_biz_ending if last_letter_vowel?
    last_vowel = last_vowel_for_o_siz_biz_ending
    return last_vowel
  end

  def siz_ending
    # ‑ınız ‑iniz ‑unuz ‑ünüz
    # After vowels: ‑nız ‑niz ‑nuz ‑nüz
    last_vowel = last_vowel_for_o_siz_biz_ending
    return "n" + last_vowel + "z" if last_letter_vowel?
    return last_vowel + "n" + last_vowel + "z"
  end

  def biz_ending
    # ‑ımız ‑imiz ‑umuz ‑ümüz
    # After vowels: ‑mız ‑miz ‑muz ‑müz
    last_vowel = last_vowel_for_o_siz_biz_ending
    return "m" + last_vowel + "z" if last_letter_vowel?
    return last_vowel + "m" + last_vowel + "z"
  end

  def onlar_ending
    # ‑ları ‑leri
    return "ıları" if lar_ending?
    return "ileri" if ler_ending?
  end
end

module HarmonyComparisons
  include Vowels
  include Consonants
  include CaseEndings
  include PluralEndings
  include CaseEndings
  include PosessiveEndings

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
    letter_preceeding_k == "n" ? noun_without_last_letter + "g" : noun_without_last_letter + "ğ"
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
    VOICED_CONSONANTS.include?(@last_letter)
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

module VerbConjugations
  include HarmonyComparisons
end

module AllTurkishGrammarHelpers
  include HarmonyComparisons

  def which_consonant_suffix?
    return "d" if last_letter_voiced_consonant? || last_letter_vowel?
    return "t"
  end

  def which_vowel_definite_past_suffix?
    return "ı" if I_TYPE_VOWEL_HARMONY_RULES[:ı].include?(@last_vowel)
    return "i" if I_TYPE_VOWEL_HARMONY_RULES[:i].include?(@last_vowel)
    return "u" if I_TYPE_VOWEL_HARMONY_RULES[:u].include?(@last_vowel)
    return "ü" if I_TYPE_VOWEL_HARMONY_RULES[:ü].include?(@last_vowel)
  end

  def definite_past_ending(pronoun)
    consonant_suffix = which_consonant_suffix?
    last_vowel = which_vowel_definite_past_suffix?
    ler_ending? ? onlar_ending = "ler" : onlar_ending = "lar"
    case pronoun
    when "ben"
      return consonant_suffix + last_vowel + "m"
    when "sen"
      return consonant_suffix + last_vowel + "n"
    when "o"
      return consonant_suffix + last_vowel
    when "siz"
      return consonant_suffix + last_vowel + "n" + last_vowel + "z"
    when "biz"
      return consonant_suffix + last_vowel + "k"
    when "onlar"
      return consonant_suffix + last_vowel + onlar_ending
    else
      return ""
    end
  end
end
