require_relative '../turkish_noun.rb'
require_relative 'turkish_nouns_context.rb'

describe 'Turkish Nouns' do
  include_context 'Turkish Nouns'
  context "Initialization" do
    it "downcases the noun given as input" do
      expect(TurkishNoun.new("ARABA").noun).to eq("araba")
    end
  end

  context "Plurals" do
    it "returns the plural form" do
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

  context "Cases" do
    context "locative" do
      it "returns the proper locative ending" do
        expect(araba.locative).to eq("arabada")
        expect(park.locative).to eq("parkta")
        expect(cami.locative).to eq("camide")
        expect(ofis.locative).to eq("ofiste")
        expect(ev.locative).to eq("evde")
        expect(kapı.locative).to eq("kapıda")
      end
    end

    context "posession" do
      it "returns the proper forms of the noun" do
        expect(ev.posession).to eq(
          {
            ben: "benim evim",
            sen: "senin evin",
            o: "onun evi",
            siz: "sizin eviniz",
            biz: "bizim evimiz",
            onlar: "onların evi"
          }
        )
      end
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