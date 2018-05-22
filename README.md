# turkish_grammar_and_conjugator
A ruby class which programmatically conjugates Turkish verbs and converts nouns to plural and other forms.

The background for this project goes back to the many websites I've seen which display lists of the different conjugations of verbs for different languages. I never knew how these individual sites did it, although I imagined that many simply took the user input and displayed the values of the conjugations by matching against values from a dictionary or text file.

Rather than displaying hard coded values, I thought it would be cool to write a program to dynamically display conjugations based on the language's established grammar rules. Turkish is a highly "regular" language, so I thought it would be a perfect fit!

The eventual goal will be to display this on a website (perhaps a Sinatra or Rails application) where users can type in a noun and get all of its forms or a verb and get all of its conjugations.

The first goal is to initialize the nouns in their different cases based on vowel harmony/consonant mutation.

Example of noun class:

```
noun = TurkishNoun.new("araba")
# Plural form
noun.plural == "arabalar"
# Locative case
noun.locative == "arabada"
# Genitive case
noun.genitive == ["arabanın", "arabaların"]
```

Example of verb class:

```
# Gitmek
verb = TurkishVerb.new("gitmek")
# Definite Past Tense
verb.definite_past_tense[:ben] == "gittim"
# Yapmak
verb = TurkishVerb.new("yapmak")
# Definite Past Tense
verb.definite_past_tense[:ben] == "yaptım"
```

Setup:

1. Clone
2. Bundle install
3. Run the specs with `rspec`
4. A sinatra application is included to view the classes. To use it, run, `ruby turkish_grammar_web_application.rb` and visit `http://localhost:4567/`
