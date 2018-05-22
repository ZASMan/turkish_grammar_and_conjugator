require 'sinatra'
require_relative 'turkish_noun.rb'

get '/' do
  @adam_noun = TurkishNoun.new("adam")
  @kopek_noun = TurkishNoun.new("köpek")
  erb :index, locals: { adam_noun: @adam_noun, kopek_noun: @kopek_noun }
end