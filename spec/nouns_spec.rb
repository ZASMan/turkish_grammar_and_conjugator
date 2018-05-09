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
      it 'should return the plural genitive endings of the noun' do
        expect(adam.genitive).to eq(["adamın", "adamların"])
        expect(göz.genitive).to eq(["gözün", "gözlerin"])
        expect(banyo.genitive).to eq(["banyonun", "banyoların"])
      end

      context "consonant harmony" do
        it "should return an array with noun transformed to account for consonant harmony" do
          expect(renk.genitive).to eq(["rengin", "renklerin"])
          expect(köpek.genitive).to eq(["köpeğin", "köpeklerin"])
          expect(ağaç.genitive).to eq(["ağacın", "ağaçların"])
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

    context "all noun forms" do
      it "should return a hash with all noun forms" do
        result = adam.all_noun_forms
        expect(result.class).to eq Hash
        %i[plural accusative_definite dative locative ablative posession genitive].each do |key|
          expect(result.has_key?(key)).to eq true
        end
      end
    end
  end
end
