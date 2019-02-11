require_relative '../turkish_verb.rb'
require_relative 'turkish_verbs_context.rb'

describe 'Turkish Verbs' do
  include_context 'Turkish Verbs'
  context "Initialization" do
    it "should downcase the verb given as input" do
      expect(TurkishVerb.new("YAPMAK").verb).to eq("yapmak")
    end

    it "should return the stem of the verb as an instance variable" do
      expect(yapmak.verb_stem).to eq("yap")
      expect(gitmek.verb_stem).to eq("git")
    end
  end

  context "Class Methods" do

    it "should return the present simple tense" do
      expect(yazmak.present_simple_tense[:ben]).to eq("yazarım")
      expect(yazmak.present_simple_tense[:sen]).to eq("yazarsın")
      expect(yazmak.present_simple_tense[:o]).to eq("yazar")
      expect(yazmak.present_simple_tense[:biz]).to eq("yazarız")
      expect(yazmak.present_simple_tense[:siz]).to eq("yazarsınız")
      expect(yazmak.present_simple_tense[:onlar]).to eq("yazarlar")
    end
    # http://turkishbasics.com/verbs/definite-past-tense.php
    it "should return the definite past tense forms" do
      expect(yazmak.definite_past_tense[:ben]).to eq("yazdım")
      expect(yazmak.definite_past_tense[:sen]).to eq("yazdın")
      expect(yazmak.definite_past_tense[:o]).to eq("yazdı")
      expect(yazmak.definite_past_tense[:siz]).to eq("yazdınız")
      expect(yazmak.definite_past_tense[:biz]).to eq("yazdık")
      expect(yazmak.definite_past_tense[:onlar]).to eq("yazdılar")
      expect(gitmek.definite_past_tense[:ben]).to eq("gittim")
      expect(gitmek.definite_past_tense[:biz]).to eq("gittik")
      expect(yapmak.definite_past_tense[:ben]).to eq("yaptım")
      expect(konusmak.definite_past_tense[:ben]).to eq("konuştum")
      expect(dusmek.definite_past_tense[:ben]).to eq("düştüm")
      expect(izlemek.definite_past_tense[:ben]).to eq("izledim")
    end

    it "should return the present continuous verb forms" do
      expect(yazmak.present_continuous_tense[:ben]).to eq('yazıyorum')
    end

    xit "should return a hash with all forms of the verb" do
      all_verb_forms = gitmek.all_verb_forms
      expect(all_verb_forms[:infinitive]).to eq("gitmek")
      expect(all_verb_forms[:verb_stem]).to eq("git")
    end
  end
end
