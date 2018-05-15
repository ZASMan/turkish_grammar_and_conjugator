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
    end

    xit "should return a hash with all forms of the verb" do
      all_verb_forms = gitmek.all_verb_forms
      expect(all_verb_forms[:infinitive]).to eq("gitmek")
      expect(all_verb_forms[:verb_stem]).to eq("git")
    end
  end
end
