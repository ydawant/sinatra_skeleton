require_relative '../models/word'

get '/' do
  @word = params[:word]
  # Look in app/views/index.erb
  erb :index
end


get '/:word' do
  @match_words = Word.anagrams_for(params[:word])

  erb :index 
end


post '/index' do
  @match_words = Word.anagrams_for(params[:word])

  erb :index 
end
