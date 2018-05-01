# turkish_grammar_and_conjugator
A ruby class which programmatically conjugates Turkish verbs and converts nouns to plural and other forms.

The eventual goal will be to display this on a website (perhaps a Sinatra or Rails application) where users can type in a noun and get all of its forms or a verb and get all of its conjugations.

The first goal is to initialize the nouns in their different cases based on vowel/consonant harmony. For example, given that you initialize a new instance of the noun class like:

```
noun = TurkishNoun.new("araba")
# Plural form
noun.plural == "arabalar"
# Locative case
noun.locative == "arabada"
# Genitive case
noun.genitive == ["arabanın", "arabaların"]
```

More to come!
