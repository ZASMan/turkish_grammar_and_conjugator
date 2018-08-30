require_relative 'helper_modules.rb'
require 'pry'

class TurkishNoun
  include AllTurkishGrammarHelpers

  attr_accessor(
    :noun,
    :word_without_consonants,
    :last_vowel,
    :last_consonant,
    :last_letter,
    :plural
  )

  def initialize(noun_infinitive)
    @noun = noun_infinitive.downcase
    @word_without_consonants = @noun.delete(CONSONANT_LIST.join(''))
    @word_without_vowels = @noun.delete(VOWEL_LIST.join(''))
    @last_vowel = @word_without_consonants[-1]
    @last_consonant = @word_without_vowels[-1]
    @last_letter = @noun[-1]
    @plural = plural
  end

  # Cases
  # Needed when verb is transitive verb
  # Needed when object of the sentence is definite and specific
  def accusative_definite
    return ""
  end
  
  # To, towards
  def dative
    if last_letter_vowel?
      return self.noun + "y" + @last_vowel
    else
      return self.noun + "a" if %w[a ı o u].include?(@last_vowel)
      return self.noun + "e" if %w[e i ö ü].include?(@last_vowel)
    end
  end

  # At, on, in
  def locative
    if last_letter_vowel?
      return self.noun + "da" if ea_harmony?
      return self.noun + "de" if ee_harmony?
    end
    if last_letter_voiced_consonant?
      return self.noun + "da" if ea_harmony?
      return self.noun + "de" if ee_harmony?
    end
    if last_letter_voiceless_consonant?
      return self.noun + "ta" if ea_harmony?
      return self.noun + "te" if ee_harmony?
    end
  end

  # From, out of, through
  def ablative
    return ""
  end

  # I.E. My house, your house, etc.
  def posession
    noun = mutate_consonants_if_necessary
    return {
      ben: "benim #{noun}" + ben_ending,
      sen: "senin #{noun}" + sen_ending,
      o: "onun #{noun}" + o_ending,
      siz: "sizin #{noun}" + siz_ending,
      biz: "bizim #{noun}" + biz_ending,
      onlar: "onların #{noun}" + onlar_ending
    }
  end
  
  # Posessive, of / 's
  # http://www.turkishlanguage.co.uk/possessiverelationship.htm
  # Note: Nouns ending in vowels use buffer letter -n to form -nin
  # But plurals are formed withou tthe buffer letter n
  def genitive
    noun = mutate_consonants_if_necessary
    result = []
    # Singular
    if iuu_harmony?
      last_letter_vowel? ? result << noun + "nün" : result << noun + "ün"
    elsif iu_harmony?
      last_letter_vowel? ? result << noun + "nun" : result << noun + "un"
    elsif ea_harmony?
      result << noun + "ın"
    elsif ee_harmony?
      result << noun + "in"
    end
    # Plural
    if lar_ending?
      result << @plural + "ın"
    elsif ler_ending?
      result << @plural + "in"
    end
    return result
  end

  # Plural

  def plural
    return self.noun + "lar" if lar_ending?
    return self.noun + "ler" if ler_ending?
  end

  def all_noun_forms
    {
      plural: plural,
      accusative_definite: accusative_definite,
      dative: dative,
      locative: locative,
      ablative: ablative,
      posession: posession,
      genitive: genitive
    }
  end
end
