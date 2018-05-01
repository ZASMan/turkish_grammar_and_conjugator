require_relative '../turkish_noun.rb'
require_relative 'turkish_nouns_context.rb'

describe 'Turkish Nouns' do
  include_context 'Turkish Nouns'
  context "Initialization" do
    it "should downcase the noun given as input" do
      expect(TurkishNoun.new("ARABA").noun).to eq("araba")
    end
  end

  context "Plurals" do
    it "should return the plural form" do
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
      it "should return the proper locative ending" do
        expect(araba.locative).to eq("arabada")
        expect(park.locative).to eq("parkta")
        expect(cami.locative).to eq("camide")
        expect(ofis.locative).to eq("ofiste")
        expect(ev.locative).to eq("evde")
        expect(kapı.locative).to eq("kapıda")
      end
    end

    context 'genitive' do
      # http://www.turkishlanguage.co.uk/possessiverelationship.htm
      xit 'should return an array with the singular and plural genitive endings of the noun' do
        expect(adam.genitive).to eq(["adamın", "adamların"])
        expect(göz.genitive).to eq(["gözün", "gözlerin"])
        expect(banyo.genitive).to eq(["banyonun", "banyoların"])
      end

      context "consonant harmony" do
        xit "should return an array with noun transformed to account for consonant harmony" do
          expect(köpek.genitive).to eq(["köpeğin", "köpeklerin"])
        end
      end
    end

    context "posession" do
      xit "should return the proper forms of the noun" do
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