require_relative '../turkish_noun.rb' 

describe 'Turkish Nouns' do
  context "Initialization" do
    it "downcases the noun given as input" do
      expect(TurkishNoun.new("ARABA").noun).to eq("araba")
    end
  end

  context "Plurals" do
  	let(:araba) { TurkishNoun.new("araba") }
  	let(:kapı) { TurkishNoun.new("kapı") }
  	let(:top) { TurkishNoun.new("top") }
  	let(:soru) { TurkishNoun.new("soru") }
  	let(:kalem) { TurkishNoun.new("kalem") }
  	let(:cami) { TurkishNoun.new("cami") }
  	let(:göz) { TurkishNoun.new("göz") }
  	let(:türk) { TurkishNoun.new("türk") }

    it "returns the plural form of a noun based on the last vowel" do
      expect(araba.plural).to eq("arabalar")
      expect(kapı.plural).to eq("kapılar")
      expect(top.plural).to eq("toplar")
      expect(soru.plural).to eq("sorular")
      expect(kalem.plural).to eq("kalemler")
      expect(cami.plural).to eq("camiler")
      expect(göz.plural).to eq("gözler")
      expect(türk.plural).to eq("türkler")
    end
  end
end

=begin

Last Vowel	Suffix
a, ı, o, u	-lar
e, i, ö, ü	-ler
Examples: 
Araba - Arabalar (Car - Cars)
Kapı - Kapılar (Door - Doors)
Top - Toplar (Ball - Balls)
Soru - Sorular (Question - Questions)

Kalem - Kalemler (Pen - Pens)
Cami - Camiler (Mosque - Mosques)
Göz - Gözler (Eye - Eyes)
Türk - Türkler (Turk - Turks)
=end