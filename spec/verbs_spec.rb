require_relative '../turkish_verb.rb'
require_relative 'turkish_verbs_context.rb'

describe 'Turkish Verbs' do
  include_context 'Turkish Verbs'
  context "Initialization" do
    xit "should downcase the verb given as input" do
      expect(TurkishVerb.new("YAPMAK").verb).to eq("yapmak")
    end

    xit "should return the stem of the verb as an instance variable" do
      expect(TurkishVerb.new("yapmak").verb_stem).to eq("yap")
      expect(TurkishVerb.new("gitmek").verb_stem).to eq("git")
    end
  end
end
